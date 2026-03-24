<?php
declare (strict_types = 1);

namespace app\cq\controller;

use app\BaseController;
use think\facade\Db;

class Kill extends BaseController
{
    /**
     * 根据当前用户等级生成 8 条怪物候选
     * 入参: open_id
     */
    public function monster_list()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }

        $user = Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            return json(['code' => 0, 'msg' => '用户不存在']);
        }

        $currentLevel = Db::table('ul_user_level')
            ->where('level_name', $user['lv'])
            ->find();

        if (!$currentLevel) {
            // 找不到等级名称时，降级用最低等级
            $currentLevel = Db::table('ul_user_level')->order('level asc,id asc')->find();
            if (!$currentLevel) {
                return json(['code' => 0, 'msg' => '等级配置不存在']);
            }
        }

        // 当前等级及以下等级，按等级从高到低
        $levels = Db::table('ul_user_level')
            ->field('id,level_name,level')
            ->where('level', '<=', (int)$currentLevel['level'])
            ->order('level desc,id desc')
            ->select()
            ->toArray();

        if (empty($levels)) {
            return json(['code' => 0, 'msg' => '可用等级为空']);
        }

        $targetCount = 8;
        $quotas = $this->buildQuotas($levels, $targetCount);

        $selected = [];
        $selectedIds = []; // 全局去重，键是 gw_id

        foreach ($levels as $idx => $lv) {
            $need = (int)($quotas[$idx] ?? 0);
            if ($need <= 0) {
                continue;
            }

            $part = $this->pickByLevel((int)$lv['id'], $need, $selectedIds, false);

            foreach ($part as $row) {
                $row['from_level_id'] = (int)$lv['id'];
                $row['from_level_name'] = (string)$lv['level_name'];
                $row['from_level'] = (int)$lv['level'];
                $selected[] = $row;
            }
        }

        // 不够 8 条时，再次补齐（优先不重复）
        if (count($selected) < $targetCount) {
            $need = $targetCount - count($selected);

            foreach ($levels as $lv) {
                if ($need <= 0) {
                    break;
                }

                $part = $this->pickByLevel((int)$lv['id'], $need, $selectedIds, false);

                foreach ($part as $row) {
                    $row['from_level_id'] = (int)$lv['id'];
                    $row['from_level_name'] = (string)$lv['level_name'];
                    $row['from_level'] = (int)$lv['level'];
                    $selected[] = $row;
                    $need--;
                    if ($need <= 0) {
                        break;
                    }
                }
            }
        }

        // 仍不够时，允许重复补齐，保证返回 8 条
        if (count($selected) < $targetCount) {
            $need = $targetCount - count($selected);

            foreach ($levels as $lv) {
                if ($need <= 0) {
                    break;
                }

                $part = $this->pickByLevel((int)$lv['id'], $need, $selectedIds, true);

                foreach ($part as $row) {
                    $row['from_level_id'] = (int)$lv['id'];
                    $row['from_level_name'] = (string)$lv['level_name'];
                    $row['from_level'] = (int)$lv['level'];
                    $selected[] = $row;
                    $need--;
                    if ($need <= 0) {
                        break;
                    }
                }
            }
        }

        // 最终截断为 8
        $selected = array_slice($selected, 0, $targetCount);

        return json([
            'code' => 200,
            'msg'  => '成功',
            'data' => [
                'open_id' => $openId,
                'user_lv' => (string)$user['lv'],
                'current_level' => [
                    'id' => (int)$currentLevel['id'],
                    'name' => (string)$currentLevel['level_name'],
                    'level' => (int)$currentLevel['level'],
                ],
                'monsters' => $selected,
            ],
        ]);
    }

    /**
     * 构建每个等级应抽取数量
     * 规则:
     * 1) 每个可用等级先给 1 个（实现“当前、前一、再前一…”）
     * 2) 剩余名额按权重分配，权重为: 当前=1，前一=2，前二=3...（越低等级越多）
     */
    private function buildQuotas(array $levels, int $target): array
    {
        $n = count($levels);

        // 可用等级 >= target，直接前 target 个各 1
        if ($n >= $target) {
            $q = array_fill(0, $n, 0);
            for ($i = 0; $i < $target; $i++) {
                $q[$i] = 1;
            }
            return $q;
        }

        // 只有 1 个等级，只能全部给当前等级
        if ($n === 1) {
            return [$target];
        }

        // baseline: 每个等级先给 1 个
        $q = array_fill(0, $n, 1);
        $remaining = $target - $n;

        // 权重: 当前=1, 前一=2, 前二=3...
        $weights = [];
        for ($i = 0; $i < $n; $i++) {
            $weights[$i] = $i + 1;
        }

        $sumW = array_sum($weights);

        // 先按比例取 floor
        $used = 0;
        for ($i = 0; $i < $n; $i++) {
            $add = (int)floor($remaining * $weights[$i] / $sumW);
            $q[$i] += $add;
            $used += $add;
        }

        // 余数从低等级开始补（数组后面的等级更低）
        $left = $remaining - $used;
        $idx = $n - 1;
        while ($left > 0) {
            $q[$idx]++;
            $left--;
            $idx--;
            if ($idx < 0) {
                $idx = $n - 1;
            }
        }

        return $q;
    }

    /**
     * 按等级从怪物池抽取 count 条
     * allowDuplicate=false 时尽量全局不重复
     */
    private function pickByLevel(int $levelId, int $count, array &$selectedIds, bool $allowDuplicate): array
    {
        if ($count <= 0) {
            return [];
        }

        $pool = Db::table('ul_user_level_kill_gw')
            ->field('gw_id,probability')
            ->where('level_id', $levelId)
            ->select()
            ->toArray();

        if (empty($pool)) {
            return [];
        }

        $gwIds = array_values(array_unique(array_map(function ($v) {
            return (int)$v['gw_id'];
        }, $pool)));

        $monsterRows = Db::table('hz_kill_gw')
            ->field('id,title,images')
            ->whereIn('id', $gwIds)
            ->select()
            ->toArray();

        $monsterMap = [];
        foreach ($monsterRows as $m) {
            $mid = (int)($m['id'] ?? 0);
            $monsterMap[$mid] = [
                'id' => $mid,
                'title' => $this->cleanUtf8((string)($m['title'] ?? '')),
                'images' => $this->cleanUtf8((string)($m['images'] ?? '')),
            ];
        }

        // 过滤无效怪物
        $validPool = [];
        foreach ($pool as $p) {
            $gid = (int)$p['gw_id'];
            if (!isset($monsterMap[$gid])) {
                continue;
            }
            $validPool[] = [
                'gw_id' => $gid,
                'probability' => (int)$p['probability'],
            ];
        }

        if (empty($validPool)) {
            return [];
        }

        $out = [];
        for ($i = 0; $i < $count; $i++) {
            $candidates = [];

            foreach ($validPool as $v) {
                $gid = (int)$v['gw_id'];
                if (!$allowDuplicate && isset($selectedIds[$gid])) {
                    continue;
                }
                $candidates[] = $v;
            }

            if (empty($candidates)) {
                break;
            }

            $chosen = $this->weightedPick($candidates);
            $gid = (int)$chosen['gw_id'];

            $item = $monsterMap[$gid];
            $item['probability'] = (int)$chosen['probability'];

            $out[] = $item;
            $selectedIds[$gid] = 1;
        }

        return $out;
    }

    /**
     * 权重随机
     * probability<=0 按 0 处理；若全为 0，则均匀随机
     */
    private function weightedPick(array $rows): array
    {
        $sum = 0;
        foreach ($rows as $r) {
            $w = (int)($r['probability'] ?? 0);
            if ($w > 0) {
                $sum += $w;
            }
        }

        // 全 0：均匀随机
        if ($sum <= 0) {
            return $rows[array_rand($rows)];
        }

        $rand = mt_rand(1, $sum);
        $acc = 0;

        foreach ($rows as $r) {
            $w = (int)($r['probability'] ?? 0);
            if ($w <= 0) {
                continue;
            }
            $acc += $w;
            if ($rand <= $acc) {
                return $r;
            }
        }

        return end($rows);
    }

    private function cleanUtf8($data)
    {
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                $data[$k] = $this->cleanUtf8($v);
            }
            return $data;
        }

        if (is_string($data)) {
            if (preg_match('//u', $data)) {
                return $data;
            }

            $tmp = @iconv('GBK', 'UTF-8//IGNORE', $data);
            if ($tmp !== false && $tmp !== '') {
                return $tmp;
            }

            $tmp = @iconv('UTF-8', 'UTF-8//IGNORE', $data);
            return $tmp === false ? '' : $tmp;
        }

        return $data;
    }

    /**
     * 获取每个等级（或一组等级）对应的怪物信息
     * 入参支持：
     * 1) level_id: 单个等级ID
     * 2) level_ids: 多个等级ID，逗号分隔，如 "1,2,3"
     * 3) min_level + max_level: 等级区间，如 10~20
     * 可选:
     * with_empty=1 返回空怪物池等级，默认0不返回
     */
    public function level_monsters()
    {
        $levelId = (int)$this->request->param('level_id', 0);
        $levelIdsStr = trim((string)$this->request->param('level_ids', ''));
        $minLevel = $this->request->param('min_level', null);
        $maxLevel = $this->request->param('max_level', null);
        $withEmpty = (int)$this->request->param('with_empty', 0);

        // 解析目标等级
        $levelsQuery = Db::table('ul_user_level')->field('id,level_name,level');

        if ($levelId > 0) {
            $levels = $levelsQuery->where('id', $levelId)->order('level asc,id asc')->select()->toArray();
        } elseif ($levelIdsStr !== '') {
            $levelIds = array_unique(array_filter(array_map('intval', explode(',', $levelIdsStr))));
            if (empty($levelIds)) {
                return json(['code' => 0, 'msg' => 'level_ids参数无效']);
            }
            $levels = $levelsQuery->whereIn('id', $levelIds)->order('level asc,id asc')->select()->toArray();
        } elseif ($minLevel !== null && $maxLevel !== null) {
            $minLevel = (int)$minLevel;
            $maxLevel = (int)$maxLevel;
            if ($minLevel > $maxLevel) {
                return json(['code' => 0, 'msg' => 'min_level不能大于max_level']);
            }
            $levels = $levelsQuery
                ->where('level', '>=', $minLevel)
                ->where('level', '<=', $maxLevel)
                ->order('level asc,id asc')
                ->select()
                ->toArray();
        } else {
            // 默认返回全部等级
            $levels = $levelsQuery->order('level asc,id asc')->select()->toArray();
        }

        if (empty($levels)) {
            return json(['code' => 0, 'msg' => '未找到等级数据']);
        }

        $result = [];
        foreach ($levels as $lv) {
            $monsters = $this->getLevelMonsters((int)$lv['id']);

            if ($withEmpty !== 1 && empty($monsters)) {
                continue;
            }

            $result[] = [
                'level_id' => (int)$lv['id'],
                'level_name' => (string)$lv['level_name'],
                'level' => (int)$lv['level'],
                'monster_count' => count($monsters),
                'monsters' => $monsters,
            ];
        }

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'count' => count($result),
                'levels' => $result,
            ],
        ]);
    }

    /**
     * 获取某个等级对应的怪物池（不使用join，避免编码问题）
     */
    private function getLevelMonsters(int $levelId): array
    {
        $relList = Db::table('ul_user_level_kill_gw')
            ->field('gw_id,probability,sort')
            ->where('level_id', $levelId)
            ->order('sort asc,id asc')
            ->select()
            ->toArray();

        if (empty($relList)) {
            return [];
        }

        $gwIds = array_values(array_unique(array_map(function ($v) {
            return (int)($v['gw_id'] ?? 0);
        }, $relList)));

        $gwRows = Db::table('hz_kill_gw')
            ->field('id,title,images')
            ->whereIn('id', $gwIds)
            ->select()
            ->toArray();

        $gwMap = [];
        foreach ($gwRows as $g) {
            $gid = (int)($g['id'] ?? 0);
            $gwMap[$gid] = [
                'id' => $gid,
                'title' => $this->cleanUtf8((string)($g['title'] ?? '')),
                'images' => $this->cleanUtf8((string)($g['images'] ?? '')),
            ];
        }

        $out = [];
        foreach ($relList as $r) {
            $gid = (int)($r['gw_id'] ?? 0);
            if (!isset($gwMap[$gid])) {
                continue;
            }
            $m = $gwMap[$gid];
            $m['probability'] = (int)($r['probability'] ?? 0);
            $m['sort'] = (int)($r['sort'] ?? 0);
            $out[] = $m;
        }

        return $out;
    }

    /*
        * 获取每个等级（或一组等级）对应的怪物信息，版本2
        * 主要改动：增加了相似怪物合并功能，相似定义为：怪物ID完全相同（即怪物池完全相同）
        * 其他入参和返回格式同 level_monsters() 保持一致
    */
    public function level_monsters1()
    {
        $levelId = (int)$this->request->param('level_id', 0);
        $levelIdsStr = trim((string)$this->request->param('level_ids', ''));
        $minLevel = $this->request->param('min_level', null);
        $maxLevel = $this->request->param('max_level', null);
        $withEmpty = (int)$this->request->param('with_empty', 0);

        $levelsQuery = Db::table('ul_user_level')->field('id,level_name,level');

        if ($levelId > 0) {
            $levels = $levelsQuery->where('id', $levelId)->order('level asc,id asc')->select()->toArray();
        } elseif ($levelIdsStr !== '') {
            $levelIds = array_unique(array_filter(array_map('intval', explode(',', $levelIdsStr))));
            if (empty($levelIds)) {
                return json(['code' => 0, 'msg' => 'level_ids参数无效']);
            }
            $levels = $levelsQuery->whereIn('id', $levelIds)->order('level asc,id asc')->select()->toArray();
        } elseif ($minLevel !== null && $maxLevel !== null) {
            $minLevel = (int)$minLevel;
            $maxLevel = (int)$maxLevel;
            if ($minLevel > $maxLevel) {
                return json(['code' => 0, 'msg' => 'min_level不能大于max_level']);
            }

            $levels = $levelsQuery
                ->where('level', '>=', $minLevel)
                ->where('level', '<=', $maxLevel)
                ->order('level asc,id asc')
                ->select()
                ->toArray();
        } else {
            $levels = $levelsQuery->order('level asc,id asc')->select()->toArray();
        }

        if (empty($levels)) {
            return json(['code' => 0, 'msg' => '未找到等级数据']);
        }

        $groups = [];
        $lastIndex = -1;
        $lastSignature = null;
        $lastLevel = null;

        foreach ($levels as $lv) {
            $monsters = $this->getLevelMonsters((int)$lv['id']);

            if ($withEmpty !== 1 && empty($monsters)) {
                continue;
            }

            $signature = $this->buildMonsterSignature($monsters);
            $currentLevel = (int)$lv['level'];

            $canMerge = $lastIndex >= 0
                && $signature === $lastSignature
                && $lastLevel !== null
                && $currentLevel === $lastLevel + 1;

            if ($canMerge) {
                $groups[$lastIndex]['end_level_id'] = (int)$lv['id'];
                $groups[$lastIndex]['end_level_name'] = (string)$lv['level_name'];
                $groups[$lastIndex]['end_level'] = $currentLevel;
                $groups[$lastIndex]['level_text'] = $groups[$lastIndex]['start_level'] . '-' . $currentLevel;
            } else {
                $groups[] = [
                    'start_level_id' => (int)$lv['id'],
                    'start_level_name' => (string)$lv['level_name'],
                    'start_level' => $currentLevel,
                    'end_level_id' => (int)$lv['id'],
                    'end_level_name' => (string)$lv['level_name'],
                    'end_level' => $currentLevel,
                    'level_text' => (string)$currentLevel,
                    'monster_count' => count($monsters),
                    'monsters' => $monsters,
                ];
                $lastIndex = count($groups) - 1;
            }

            $lastSignature = $signature;
            $lastLevel = $currentLevel;
        }

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'count' => count($groups),
                'levels' => array_values($groups),
            ],
        ]);
    }

    private function buildMonsterSignature(array $monsters): string
    {
        $ids = [];

        foreach ($monsters as $monster) {
            $ids[] = (int)($monster['id'] ?? 0);
        }

        sort($ids);

        return implode(',', $ids);
    }

    /**
     * 打怪抽奖接口
     * 入参:
     * open_id 用户open_id
     * gw_id   怪物ID (可选，不传或0则随机选择)
     */
    public function draw()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        $gwId = (int)$this->request->param('gw_id', 0);

        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }

        $user = Db::table('ul_order_user')->where('open_id', $openId)->find();
        if (!$user) {
            return json(['code' => 0, 'msg' => '用户不存在']);
        }

        // 当前用户等级
        $currentLevel = Db::table('ul_user_level')
            ->where('level_name', (string)$user['lv'])
            ->find();

        if (!$currentLevel) {
            $currentLevel = Db::table('ul_user_level')->order('level asc,id asc')->find();
            if (!$currentLevel) {
                return json(['code' => 0, 'msg' => '等级配置不存在']);
            }
        }

        // 可用等级ID
        $levelIds = Db::table('ul_user_level')
            ->where('level', '<=', (int)$currentLevel['level'])
            ->column('id');

        if (empty($levelIds)) {
            return json(['code' => 0, 'msg' => '可用等级为空']);
        }

        // 如果未指定怪物ID，随机选择一个可打怪物
        if ($gwId <= 0) {
            $availableMonsters = Db::table('ul_user_level_kill_gw')
                ->field('gw_id,probability')
                ->whereIn('level_id', $levelIds)
                ->select()
                ->toArray();

            if (empty($availableMonsters)) {
                return json(['code' => 0, 'msg' => '无可用怪物']);
            }

            // 按概率随机选择怪物
            $chosenMonster = $this->weightedPick($availableMonsters);
            $gwId = (int)$chosenMonster['gw_id'];
        }

        $monster = Db::table('hz_kill_gw')
            ->field('id,title,images')
            ->where('id', $gwId)
            ->find();
        if (!$monster) {
            return json(['code' => 0, 'msg' => '怪物不存在']);
        }

        // 验证怪物是否可打
        $canFight = Db::table('ul_user_level_kill_gw')
            ->whereIn('level_id', $levelIds)
            ->where('gw_id', $gwId)
            ->count();

        if ((int)$canFight <= 0) {
            return json(['code' => 0, 'msg' => '该怪物不在当前可打范围内']);
        }

        // 消耗金币配置
        $killCfg = Db::table('hz_kill')->where('id', 1)->find();
        $consumeCoin = max(0, (int)($killCfg['consume_coin'] ?? 0));

        $userCoin = (float)($user['coin_num'] ?? 0);
        if ($consumeCoin > 0 && $userCoin < $consumeCoin) {
            return json(['code' => 0, 'msg' => '金币不足']);
        }

        // 怪物掉落池
        $dropPool = Db::table('ul_kill_gw_item')
            ->field('id,item_id,probability,min_num,max_num,sort')
            ->where('gw_id', $gwId)
            ->order('sort asc,id asc')
            ->select()
            ->toArray();

        if (empty($dropPool)) {
            return json(['code' => 0, 'msg' => '该怪物未配置掉落物品']);
        }

        // 从奖池随机抽取5次，允许重复，后续去重
        $draws = [];
        for ($i = 0; $i < 5; $i++) {
            $picked = $this->weightedPick($dropPool);
            $itemId = (int)($picked['item_id'] ?? 0);
            $minNum = max(1, (int)($picked['min_num'] ?? 1));
            $maxNum = max($minNum, (int)($picked['max_num'] ?? 1));
            $dropNum = mt_rand($minNum, $maxNum);
            $draws[] = [
                'item_id' => $itemId,
                'num' => $dropNum,
                'probability' => (int)($picked['probability'] ?? 0),
            ];
        }

        // 去重：相同item_id累加数量
        $mergedDraws = [];
        foreach ($draws as $draw) {
            $itemId = $draw['item_id'];
            if (!isset($mergedDraws[$itemId])) {
                $mergedDraws[$itemId] = $draw;
            } else {
                $mergedDraws[$itemId]['num'] += $draw['num'];
            }
        }

        // 查询物品配置
        $itemIds = array_keys($mergedDraws);
        $itemRows = Db::table('hz_kill_wp')
            ->whereIn('id', $itemIds)
            ->select()
            ->toArray();
        $itemMap = [];
        foreach ($itemRows as $row) {
            $itemMap[(int)$row['id']] = $row;
        }

        Db::startTrans();
        try {
            // 1) 扣金币 + 扣费日志
            if ($consumeCoin > 0) {
                $deductLogId = Db::table('coin_info')->insertGetId([
                    'open_id' => $openId,
                    'coin_num' => $consumeCoin,
                    'type' => 17,
                    'code' => 1,
                    'fs' => '打怪抽奖',
                    'title' => '打怪抽奖消耗',
                    'real' => $consumeCoin,
                    'difference' => 0,
                ]);
                if ($deductLogId <= 0) {
                    throw new \Exception('写入扣费日志失败');
                }

                $decOk = Db::table('ul_order_user')
                    ->where('open_id', $openId)
                    ->dec('coin_num', $consumeCoin)
                    ->update();

                if (!$decOk) {
                    throw new \Exception('扣除金币失败');
                }
            }

            // 2) 入背包 + 背包流水
            $bagResults = [];
            $rewards = [];
            foreach ($mergedDraws as $itemId => $draw) {
                if (!isset($itemMap[$itemId])) {
                    throw new \Exception("物品配置不存在 item_id={$itemId}");
                }
                $item = $itemMap[$itemId];
                $bagResult = $this->addItemToBag($user, $item, $draw['num'], 'kill_draw', 0);
                $bagResults[] = $bagResult;
                $rewards[] = [
                    'item_id' => (int)$item['id'],
                    'item_title' => $this->cleanUtf8((string)$item['title']),
                    'item_images' => $this->cleanUtf8((string)$item['images']),
                    'value_min' => (float)($item['value_min'] ?? 0),
                    'value_max' => (float)($item['value_max'] ?? 0),
                    'num' => $draw['num'],
                    'probability' => $draw['probability'],
                ];
            }

            // 3) 抽奖结果日志
            $dropTitles = [];
            foreach ($rewards as $r) {
                $dropTitles[] = (string)$r['item_title'] . ' x' . $r['num'];
            }
            $drawLogId = Db::table('coin_info')->insertGetId([
                'open_id' => $openId,
                'coin_num' => 0,
                'type' => 17,
                'code' => 0,
                'fs' => '打怪抽奖',
                'title' => '掉落:' . implode(', ', $dropTitles),
                'real' => 0,
                'difference' => 0,
            ]);
            if ($drawLogId <= 0) {
                throw new \Exception('写入抽奖日志失败');
            }

            Db::commit();

            $latestUser = Db::table('ul_order_user')
                ->field('id,open_id,lv,coin_num')
                ->where('open_id', $openId)
                ->find();

            return json([
                'code' => 200,
                'msg' => '抽奖成功',
                'data' => [
                    'consume_coin' => $consumeCoin,
                    'monster' => [
                        'id' => (int)$monster['id'],
                        'title' => $this->cleanUtf8((string)$monster['title']),
                        'images' => $this->cleanUtf8((string)$monster['images']),
                    ],
                    'rewards' => $rewards,
                    'bag' => $bagResults,
                    'user' => $latestUser,
                ],
            ]);
        } catch (\Throwable $e) {
            Db::rollback();
            return json(['code' => 0, 'msg' => '抽奖失败: ' . $e->getMessage()]);
        }
    }
    /**
     * 入背包并写流水
     */
    private function addItemToBag(array $user, array $item, int $num, string $bizType, int $bizId = 0): array
    {
        $openId = (string)($user['open_id'] ?? '');
        $userId = (int)($user['id'] ?? 0);
        $itemId = (int)($item['id'] ?? 0);
        $now = time();

        $bagRow = Db::table('ul_user_item_bag')
            ->where('open_id', $openId)
            ->where('item_id', $itemId)
            ->find();

        if ($bagRow) {
            $before = (int)$bagRow['total_num'];
            $after = $before + $num;

            $ok = Db::table('ul_user_item_bag')
                ->where('id', (int)$bagRow['id'])
                ->update([
                    'total_num' => $after,
                    'update_time' => $now,
                ]);

            if ($ok === false) {
                throw new \Exception('更新背包失败');
            }
        } else {
            $before = 0;
            $after = $num;

            $ok = Db::table('ul_user_item_bag')->insert([
                'open_id' => $openId,
                'user_id' => $userId,
                'item_id' => $itemId,
                'item_title' => (string)($item['title'] ?? ''),
                'item_images' => (string)($item['images'] ?? ''),
                'total_num' => $after,
                'used_num' => 0,
                'status' => 1,
                'create_time' => $now,
                'update_time' => $now,
            ]);

            if (!$ok) {
                throw new \Exception('写入背包失败');
            }
        }

        $logOk = Db::table('ul_user_item_bag_log')->insert([
            'open_id' => $openId,
            'user_id' => $userId,
            'item_id' => $itemId,
            'change_num' => $num,
            'before_num' => $before,
            'after_num' => $after,
            'biz_type' => $bizType,
            'biz_id' => $bizId,
            'remark' => '打怪掉落入包',
            'create_time' => $now,
        ]);

        if (!$logOk) {
            throw new \Exception('写入背包流水失败');
        }

        return [
            'item_id' => $itemId,
            'before_num' => $before,
            'add_num' => $num,
            'after_num' => $after,
        ];
    }

    /**
     * 获取用户背包物品列表
     * 入参:
     * open_id 必填
     * page 可选，默认1
     * limit 可选，默认20，最大100
     * with_zero 可选，1=包含数量为0，默认0=只返回有库存
     */
    public function bag_list()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        $page = max(1, (int)$this->request->param('page', 1));
        $limit = (int)$this->request->param('limit', 20);
        $withZero = (int)$this->request->param('with_zero', 0);

        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }

        if ($limit <= 0) {
            $limit = 20;
        }
        if ($limit > 100) {
            $limit = 100;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,lv')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            return json(['code' => 0, 'msg' => '用户不存在']);
        }

        $query = Db::table('ul_user_item_bag')
            ->field('id,item_id,item_title,item_images,total_num,used_num,status,update_time,create_time')
            ->where('open_id', $openId);

        // 默认只看有库存的
        if ($withZero !== 1) {
            $query->where('total_num', '>', 0);
        }

        $count = (clone $query)->count();

        $list = $query
            ->order('update_time desc,id desc')
            ->page($page, $limit)
            ->select()
            ->toArray();

        // 查物品配置补充价值字段
        $itemIds = array_unique(array_column($list, 'item_id'));
        if (!empty($itemIds)) {
            $itemRows = Db::table('hz_kill_wp')
                ->field('id,value_min,value_max,title,images')
                ->whereIn('id', $itemIds)
                ->select()
                ->toArray();

            $itemMap = [];
            foreach ($itemRows as $r) {
                $itemMap[(int)$r['id']] = $r;
            }
        } else {
            $itemMap = [];
        }

        foreach ($list as &$row) {
            $total = max(0, (int)($row['total_num'] ?? 0));
            $used = max(0, (int)($row['used_num'] ?? 0));
            if ($used > $total) {
                $used = $total;
            }

            $row['item_id'] = (int)$row['item_id'];
            $row['total_num'] = $total;
            $row['used_num'] = $used;
            $row['usable_num'] = $total - $used;
            $row['status'] = (int)$row['status'];
            $row['item_title'] = $this->cleanUtf8((string)($row['item_title'] ?? ''));
            $row['item_images'] = $this->cleanUtf8((string)($row['item_images'] ?? ''));
            $row['update_time'] = (int)$row['update_time'];
            $row['create_time'] = (int)$row['create_time'];

            $cfg = $itemMap[(int)$row['item_id']] ?? null;
            $row['value_min'] = $cfg ? (float)($cfg['value_min'] ?? 0) : 0;
            $row['value_max'] = $cfg ? (float)($cfg['value_max'] ?? 0) : 0;
            // 兼容老接口字段
            if ($cfg && empty($row['item_title'])) {
                $row['item_title'] = $this->cleanUtf8((string)($cfg['title'] ?? ''));
            }
            if ($cfg && empty($row['item_images'])) {
                $row['item_images'] = $this->cleanUtf8((string)($cfg['images'] ?? ''));
            }
        }
        unset($row);

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'user' => [
                    'id' => (int)$user['id'],
                    'open_id' => (string)$user['open_id'],
                    'lv' => (string)$user['lv'],
                ],
                'page' => $page,
                'limit' => $limit,
                'count' => (int)$count,
                'list' => $list,
            ],
        ]);
    }

    /**
     * 回收背包物品接口
     * 入参:
     * open_id 必填
     * items 必填，格式: [{"item_id":1,"num":2},...]
     * 返回: 每个物品获得金币、总金币等
     */
    public function recycle_items()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        $items = $this->request->param('items', []);
        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }
        if (!is_array($items) || empty($items)) {
            return json(['code' => 0, 'msg' => 'items参数无效']);
        }

        $user = Db::table('ul_order_user')->where('open_id', $openId)->find();
        if (!$user) {
            return json(['code' => 0, 'msg' => '用户不存在']);
        }

        // 查询背包所有物品
        $bagRows = Db::table('ul_user_item_bag')
            ->where('open_id', $openId)
            ->select()
            ->toArray();
        $bagMap = [];
        foreach ($bagRows as $row) {
            $bagMap[(int)$row['item_id']] = $row;
        }

        // 查询物品配置
        $itemIds = array_unique(array_column($items, 'item_id'));
        $itemRows = Db::table('hz_kill_wp')
            ->whereIn('id', $itemIds)
            ->select()
            ->toArray();
        $itemMap = [];
        foreach ($itemRows as $row) {
            $itemMap[(int)$row['id']] = $row;
        }

        $results = [];
        $totalCoin = 0;
        $now = time();

        Db::startTrans();
        try {
            foreach ($items as $item) {
                $itemId = (int)($item['item_id'] ?? 0);
                $num = (int)($item['num'] ?? 0);
                if ($itemId <= 0 || $num <= 0) {
                    throw new \Exception("item_id={$itemId} 数量无效");
                }
                if (!isset($bagMap[$itemId])) {
                    throw new \Exception("背包无此物品 item_id={$itemId}");
                }
                $bag = $bagMap[$itemId];
                $usable = max(0, (int)$bag['total_num'] - (int)$bag['used_num']);
                if ($usable < $num) {
                    throw new \Exception("物品{$itemId}库存不足");
                }
                if (!isset($itemMap[$itemId])) {
                    throw new \Exception("物品配置不存在 item_id={$itemId}");
                }
                $cfg = $itemMap[$itemId];
                $min = max(0, (int)($cfg['value_min'] ?? 0));
                $max = max($min, (int)($cfg['value_max'] ?? 0));
                $coin = mt_rand($min, $max) * $num;
                $totalCoin += $coin;

                // 扣除背包
                $before = (int)$bag['total_num'];
                $after = $before - $num;
                $ok = Db::table('ul_user_item_bag')
                    ->where('id', (int)$bag['id'])
                    ->update([
                        'total_num' => $after,
                        'update_time' => $now,
                    ]);
                if ($ok === false) {
                    throw new \Exception("扣除背包失败 item_id={$itemId}");
                }

                // 写背包流水
                $logOk = Db::table('ul_user_item_bag_log')->insert([
                    'open_id' => $openId,
                    'user_id' => (int)$user['id'],
                    'item_id' => $itemId,
                    'change_num' => -$num,
                    'before_num' => $before,
                    'after_num' => $after,
                    'biz_type' => 'recycle',
                    'biz_id' => 0,
                    'remark' => '物品回收',
                    'create_time' => $now,
                    'coin_num' => $coin,
                ]);
                if (!$logOk) {
                    throw new \Exception("写入背包流水失败 item_id={$itemId}");
                }

                $results[] = [
                    'item_id' => $itemId,
                    'item_title' => $this->cleanUtf8((string)($cfg['title'] ?? '')),
                    'num' => $num,
                    'coin' => $coin,
                ];
            }

            // 增加金币
            if ($totalCoin > 0) {
                $coinLogId = Db::table('coin_info')->insertGetId([
                    'open_id' => $openId,
                    'coin_num' => $totalCoin,
                    'type' => 18,
                    'code' => 0,
                    'fs' => '物品回收',
                    'title' => '物品回收获得金币',
                    'real' => $totalCoin,
                    'difference' => 0,
                ]);
                if ($coinLogId <= 0) {
                    throw new \Exception('写入金币日志失败');
                }
                $incOk = Db::table('ul_order_user')
                    ->where('open_id', $openId)
                    ->inc('coin_num', $totalCoin)
                    ->update();
                if (!$incOk) {
                    throw new \Exception('增加金币失败');
                }
            }

            Db::commit();

            $latestUser = Db::table('ul_order_user')
                ->field('id,open_id,lv,coin_num')
                ->where('open_id', $openId)
                ->find();

            return json([
                'code' => 200,
                'msg' => '回收成功',
                'data' => [
                    'total_coin' => $totalCoin,
                    'items' => $results,
                    'user' => $latestUser,
                ],
            ]);
        } catch (\Throwable $e) {
            Db::rollback();
            return json(['code' => 0, 'msg' => '回收失败: ' . $e->getMessage()]);
        }
    }
    //获取打怪配置
    public function get_kill_config()
    {
        $killCfg = Db::table('hz_kill')->where('id', 1)->find();
        if (!$killCfg) {
            return json(['code' => 0, 'msg' => '打怪配置不存在']);
        }

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'consume_coin' => max(0, (int)($killCfg['consume_coin'] ?? 0)),
                'start_btn_image' => $killCfg['start_btn_image'], 
                'start_btn_bg' => $killCfg['start_btn_bg'], 
                'monster_bg' => $killCfg['monster_bg']
            ],
        ]);
    }
    /**
     * 查询打怪记录
     */
    public function kill_record_list()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }

        $page = max(1, (int)$this->request->param('page', 1));
        $limit = min(100, max(1, (int)$this->request->param('limit', 20)));

        $query = Db::table('coin_info')
            ->where('open_id', $openId)
            ->where('fs', '打怪抽奖');

        $startDate = trim((string)$this->request->param('start_date', ''));
        $endDate   = trim((string)$this->request->param('end_date', ''));
        if ($startDate !== '') {
            $query->where('updata_time', '>=', strtotime($startDate));
        }
        if ($endDate !== '') {
            $query->where('updata_time', '<=', strtotime($endDate . ' 23:59:59'));
        }

        $total = (int)$query->count();
        $rows = $query->order('updata_time desc')->page($page, $limit)->select()->toArray();

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'open_id' => $openId,
                'page' => $page,
                'limit' => $limit,
                'total' => $total,
                'rows' => $rows,
            ],
        ]);
    }
    /**
     * 兑换记录接口（掉落物品回收）
     */
    public function exchange_record_list()
    {
        $openId = trim((string)$this->request->param('open_id', ''));
        if ($openId === '') {
            return json(['code' => 0, 'msg' => 'open_id不能为空']);
        }

        $page = max(1, (int)$this->request->param('page', 1));
        $limit = min(100, max(1, (int)$this->request->param('limit', 20)));

        $query = Db::table('ul_user_item_bag_log')
            ->where('open_id', $openId)
            ->where('biz_type', 'recycle');

        $itemId = (int)$this->request->param('item_id', 0);
        if ($itemId > 0) {
            $query->where('item_id', $itemId);
        }

        $startDate = trim((string)$this->request->param('start_date', ''));
        $endDate = trim((string)$this->request->param('end_date', ''));
        if ($startDate !== '') {
            $query->where('create_time', '>=', strtotime($startDate));
        }
        if ($endDate !== '') {
            $query->where('create_time', '<=', strtotime($endDate . ' 23:59:59'));
        }

        $total = (int)$query->count();
        $rows = $query->order('create_time desc')->page($page, $limit)->select()->toArray();

        // 批量查询物品名称，回填到记录
        $itemIds = array_values(array_unique(array_map(function ($row) {
            return (int)($row['item_id'] ?? 0);
        }, $rows)));
        $itemIds = array_values(array_filter($itemIds));

        $itemMap = [];
        if (!empty($itemIds)) {
            $itemRows = Db::table('hz_kill_wp')
                ->field('id,title')
                ->whereIn('id', $itemIds)
                ->select()
                ->toArray();

            foreach ($itemRows as $item) {
                $iid = (int)($item['id'] ?? 0);
                $itemMap[$iid] = $this->cleanUtf8((string)($item['title'] ?? ''));
            }
        }

        foreach ($rows as &$row) {
            $iid = (int)($row['item_id'] ?? 0);
            $row['item_title'] = $itemMap[$iid] ?? '';
            $ts = (int)($row['create_time'] ?? 0);
            $row['create_time'] = $ts > 0 ? date('Y-m-d H:i:s', $ts) : '';
        }
        unset($row);
        

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'open_id' => $openId,
                'page' => $page,
                'limit' => $limit,
                'total' => $total,
                'rows' => $rows,
            ],
        ]);
    }

    /**
     * 获取 coin_info 最新100条，并随机返回10条
     */
    public function latest_coin_random_list()
    {
        // 先取最新100条
        $rows = Db::table('coin_info')
            ->order('id desc')
            ->limit(100)
            ->select()
            ->toArray();

        if (empty($rows)) {
            return json([
                'code' => 200,
                'msg' => '成功',
                'data' => [
                    'rows' => [],
                ],
            ]);
        }

        // 随机打散，再取前10条
        shuffle($rows);
        $picked = array_slice($rows, 0, 10);

        return json([
            'code' => 200,
            'msg' => '成功',
            'data' => [
                'rows' => $picked,
            ],
        ]);
    }
}