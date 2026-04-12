<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\facade\Db;

/**
 * @ControllerAnnotation(title="打怪抽奖配置")
 */
class Kill extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isPost()) {
            $data = [
                'consume_coin' => (int)$this->request->param('consume_coin', 0),
                'start_btn_image' => trim((string)$this->request->param('start_btn_image')),
                'start_btn_bg' => trim((string)$this->request->param('start_btn_bg')),
                'monster_bg' => trim((string)$this->request->param('monster_bg')),
                'red_num' => trim((string)$this->request->param('red_num', '0')),
                'red_probality' => (int)$this->request->param('red_probality', 0),
                'red_image' => trim((string)$this->request->param('red_image')),
            ];

            if ($data['consume_coin'] < 0) {
                $this->error('消耗金币不能小于0');
            }

            if ($data['red_probality'] < 0 || $data['red_probality'] > 100) {
                $this->error('红包概率必须在0-100之间');
            }

            if ($data['red_num'] === '') {
                $this->error('红包赠送数量不能为空');
            }

            $exists = Db::table('hz_kill')->where('id', 1)->find();

            if ($exists) {
                $ok = Db::table('hz_kill')->where('id', 1)->update($data);
            } else {
                $data['id'] = 1;
                $ok = Db::table('hz_kill')->insert($data);
            }

            $ok !== false ? $this->success('保存成功') : $this->error('保存失败');
        }

        $row = Db::table('hz_kill')->where('id', 1)->find();
        return $this->fetch('index', ['row' => $row]);
    }
    /**
     * @NodeAnotation(title="怪物库列表")
     */
    public function open_gwlist()
    {
        if ($this->request->isAjax()) {
            $page = (int)$this->request->param('page', 1);
            $limit = (int)$this->request->param('limit', 10);

            $count = Db::table('hz_kill_gw')->count();
            $list = Db::table('hz_kill_gw')
                ->order($this->sort)
                ->page($page, $limit)
                ->select();

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch('open_gwlist');
    }

    /**
     * @NodeAnotation(title="新增怪物")
     */
    public function add_gw()
    {
        if ($this->request->isPost()) {
            $data = [
                'title'  => trim((string)$this->request->param('title')),
                'images' => trim((string)$this->request->param('images')),
            ];

            if ($data['title'] === '') {
                return json(['code' => 0, 'msg' => '怪物名称不能为空']);
            }

            $ok = Db::table('hz_kill_gw')->insert($data);
            return json($ok ? ['code' => 1, 'msg' => '添加成功'] : ['code' => 0, 'msg' => '添加失败']);
        }

        return $this->fetch('add_gw');
    }

    /**
     * @NodeAnotation(title="编辑怪物")
     */
    public function edit_gw($id)
    {
        $row = Db::table('hz_kill_gw')->find($id);
        if (!$row) {
            $this->error('数据不存在');
        }

        if ($this->request->isPost()) {
            $data = [
                'title'  => trim((string)$this->request->param('title')),
                'images' => trim((string)$this->request->param('images')),
            ];

            if ($data['title'] === '') {
                return json(['code' => 0, 'msg' => '怪物名称不能为空']);
            }

            $ok = Db::table('hz_kill_gw')->where('id', $id)->update($data);
            return json($ok !== false ? ['code' => 1, 'msg' => '修改成功'] : ['code' => 0, 'msg' => '修改失败']);
        }

        return $this->fetch('edit_gw', ['list' => $row]);
    }

    /**
     * @NodeAnotation(title="删除怪物")
     */
    public function delete_gw($id)
    {
        $ok = Db::table('hz_kill_gw')->delete($id);
        return json($ok ? ['code' => 1, 'msg' => '删除成功'] : ['code' => 0, 'msg' => '删除失败']);
    }

    /**
     * @NodeAnotation(title="物品库列表")
     */
    public function open_wplist()
    {
        if ($this->request->isAjax()) {
            $page = (int)$this->request->param('page', 1);
            $limit = (int)$this->request->param('limit', 10);

            $count = Db::table('hz_kill_wp')->count();
            $list = Db::table('hz_kill_wp')
                ->order($this->sort)
                ->page($page, $limit)
                ->select();

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch('open_wplist');
    }

    /**
     * @NodeAnotation(title="新增物品")
     */
    public function add_wp()
    {
        if ($this->request->isPost()) {
            $data = [
                'title' => trim((string)$this->request->param('title')),
                'images' => trim((string)$this->request->param('images')),
                'value_min' => (float)$this->request->param('value_min', 0),
                'value_max' => (float)$this->request->param('value_max', 0),
                'exp' => (int)$this->request->param('exp', 0),
                'mark' => trim((string)$this->request->param('mark', '')),
            ];

            if ($data['title'] === '') {
                return json(['code' => 0, 'msg' => '物品名称不能为空']);
            }
            if ($data['value_min'] < 0 || $data['value_max'] < 0) {
                return json(['code' => 0, 'msg' => '价值不能为负数']);
            }
            if ($data['value_min'] > $data['value_max']) {
                return json(['code' => 0, 'msg' => '价值区间不正确']);
            }
            if ($data['exp'] < 0) {
                return json(['code' => 0, 'msg' => '经验值不能为负数']);
            }

            $ok = Db::table('hz_kill_wp')->insert($data);
            return json($ok ? ['code' => 1, 'msg' => '添加成功'] : ['code' => 0, 'msg' => '添加失败']);
        }

        return $this->fetch('add_wp');
    }

    /**
     * @NodeAnotation(title="编辑物品")
     */
    public function edit_wp($id)
    {
        $row = Db::table('hz_kill_wp')->find($id);
        if (!$row) {
            $this->error('数据不存在');
        }

        if ($this->request->isPost()) {
            $data = [
                'title' => trim((string)$this->request->param('title')),
                'images' => trim((string)$this->request->param('images')),
                'value_min' => (float)$this->request->param('value_min', 0),
                'value_max' => (float)$this->request->param('value_max', 0),
                'exp' => (int)$this->request->param('exp', 0),
                'mark' => trim((string)$this->request->param('mark', '')),
            ];

            if ($data['title'] === '') {
                return json(['code' => 0, 'msg' => '物品名称不能为空']);
            }
            if ($data['value_min'] < 0 || $data['value_max'] < 0) {
                return json(['code' => 0, 'msg' => '价值不能为负数']);
            }
            if ($data['value_min'] > $data['value_max']) {
                return json(['code' => 0, 'msg' => '价值区间不正确']);
            }
            if ($data['exp'] < 0) {
                return json(['code' => 0, 'msg' => '经验值不能为负数']);
            }

            $ok = Db::table('hz_kill_wp')->where('id', $id)->update($data);
            return json($ok !== false ? ['code' => 1, 'msg' => '修改成功'] : ['code' => 0, 'msg' => '修改失败']);
        }

        return $this->fetch('edit_wp', ['list' => $row]);
    }

    /**
     * @NodeAnotation(title="删除物品")
     */
    public function delete_wp($id)
    {
        $ok = Db::table('hz_kill_wp')->delete($id);
        return json($ok ? ['code' => 1, 'msg' => '删除成功'] : ['code' => 0, 'msg' => '删除失败']);
    }

    /**
     * @NodeAnotation(title="怪物掉落池")
     */
    public function monster_items($id)
    {
        $gw = Db::table('hz_kill_gw')->find($id);
        if (!$gw) {
            $this->error('怪物不存在');
        }

        if ($this->request->isAjax()) {
            $page = (int)$this->request->param('page', 1);
            $limit = (int)$this->request->param('limit', 10);

            $count = Db::table('ul_kill_gw_item')
                ->where('gw_id', $id)
                ->count();

            // 先查关系表（分页）
            $relList = Db::table('ul_kill_gw_item')
                ->field('id,gw_id,item_id,probability,min_num,max_num,sort')
                ->where('gw_id', $id)
                ->order('sort asc,id asc')
                ->page($page, $limit)
                ->select()
                ->toArray();

            // 批量查物品
            $itemIds = array_values(array_unique(array_map(function ($v) {
                return (int)($v['item_id'] ?? 0);
            }, $relList)));

            $itemMap = [];
            if (!empty($itemIds)) {
                $items = Db::table('hz_kill_wp')
                    ->field('id,title,images,value_min,value_max')
                    ->whereIn('id', $itemIds)
                    ->select()
                    ->toArray();

                foreach ($items as $it) {
                    $itemMap[(int)$it['id']] = $it;
                }
            }

            // 合并返回
            $list = [];
            foreach ($relList as $r) {
                $iid = (int)$r['item_id'];
                $it = $itemMap[$iid] ?? [
                    'title' => '',
                    'images' => '',
                    'value_min' => 0,
                    'value_max' => 0,
                ];

                $list[] = [
                    'id' => (int)$r['id'],
                    'gw_id' => (int)$r['gw_id'],
                    'item_id' => $iid,
                    'probability' => (int)$r['probability'],
                    'min_num' => (int)$r['min_num'],
                    'max_num' => (int)$r['max_num'],
                    'sort' => (int)$r['sort'],
                    'title' => (string)$it['title'],
                    'images' => (string)$it['images'],
                    'value_min' => (float)$it['value_min'],
                    'value_max' => (float)$it['value_max'],
                ];
            }

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch('monster_items', ['gw' => $gw]);
    }

    /**
     * @NodeAnotation(title="添加掉落物品")
     */
    public function add_monster_items($id)
    {
        $gw = Db::table('hz_kill_gw')->find($id);
        if (!$gw) {
            $this->error('怪物不存在');
        }

        if ($this->request->isPost()) {
            $itemIds = $this->request->param('item_ids/a', []);
            $probMap = $this->request->param('prob/a', []);
            $minMap = $this->request->param('min_num/a', []);
            $maxMap = $this->request->param('max_num/a', []);

            $itemIds = array_unique(array_filter(array_map('intval', (array)$itemIds)));
            $time = time();

            // 先查出当前所有已配置的物品
            $oldItems = Db::table('ul_kill_gw_item')
                ->where('gw_id', $id)
                ->column('item_id');

            // 需要删除的（之前有现在没勾选的）
            $toDelete = array_diff($oldItems, $itemIds);
            if (!empty($toDelete)) {
                Db::table('ul_kill_gw_item')
                    ->where('gw_id', $id)
                    ->whereIn('item_id', $toDelete)
                    ->delete();
            }

            // 需要新增或更新的
            foreach ($itemIds as $itemId) {
                $prob = isset($probMap[$itemId]) ? (int)$probMap[$itemId] : 0;
                $minNum = isset($minMap[$itemId]) ? (int)$minMap[$itemId] : 1;
                $maxNum = isset($maxMap[$itemId]) ? (int)$maxMap[$itemId] : 1;

                if ($prob < 0) {
                    return json(['code' => 0, 'msg' => '概率不能小于0']);
                }
                if ($minNum < 1 || $maxNum < 1) {
                    return json(['code' => 0, 'msg' => '掉落数量必须大于等于1']);
                }
                if ($maxNum < $minNum) {
                    return json(['code' => 0, 'msg' => '最大掉落数量不能小于最小掉落数量']);
                }

                $exists = Db::table('ul_kill_gw_item')
                    ->where('gw_id', $id)
                    ->where('item_id', $itemId)
                    ->find();

                $saveData = [
                    'probability' => $prob,
                    'min_num' => $minNum,
                    'max_num' => $maxNum,
                    'update_time' => $time,
                ];

                if ($exists) {
                    Db::table('ul_kill_gw_item')->where('id', $exists['id'])->update($saveData);
                } else {
                    $saveData['gw_id'] = $id;
                    $saveData['item_id'] = $itemId;
                    $saveData['sort'] = 0;
                    $saveData['create_time'] = $time;
                    Db::table('ul_kill_gw_item')->insert($saveData);
                }
            }

            return json(['code' => 1, 'msg' => '保存成功']);
        }

        $items = Db::table('hz_kill_wp')
            ->field('id,title,images,value_min,value_max')
            ->order('id desc')
            ->select()
            ->toArray();

        $cfgRows = Db::table('ul_kill_gw_item')
            ->field('item_id,probability,min_num,max_num')
            ->where('gw_id', $id)
            ->select()
            ->toArray();

        $cfgMap = [];
        foreach ($cfgRows as $c) {
            $cfgMap[(int)$c['item_id']] = $c;
        }

        foreach ($items as &$it) {
            $iid = (int)$it['id'];
            $cfg = $cfgMap[$iid] ?? null;
            $it['checked'] = $cfg ? 1 : 0;
            $it['probability'] = $cfg ? (int)$cfg['probability'] : 0;
            $it['min_num'] = $cfg ? (int)$cfg['min_num'] : 1;
            $it['max_num'] = $cfg ? (int)$cfg['max_num'] : 1;
        }
        unset($it);

        return $this->fetch('add_monster_items', [
            'gw' => $gw,
            'items' => $items,
        ]);
    }

    /**
     * @NodeAnotation(title="修改掉落池")
     */
    public function modify_monster_item($id)
    {
        $field = (string)$this->request->param('field', '');
        $value = (int)$this->request->param('value', 0);

        if (!in_array($field, ['probability', 'sort', 'min_num', 'max_num'])) {
            $this->error('不允许修改该字段');
        }

        if ($value < 0) {
            $this->error('数值不能小于0');
        }

        $row = Db::table('ul_kill_gw_item')->find($id);
        if (!$row) {
            $this->error('数据不存在');
        }

        if (($field === 'min_num' || $field === 'max_num') && $value < 1) {
            $this->error('数量必须大于等于1');
        }

        $newMin = $field === 'min_num' ? $value : (int)$row['min_num'];
        $newMax = $field === 'max_num' ? $value : (int)$row['max_num'];

        if ($newMax < $newMin) {
            $this->error('最大掉落数量不能小于最小掉落数量');
        }

        $ok = Db::table('ul_kill_gw_item')
            ->where('id', $id)
            ->update([
                $field => $value,
                'update_time' => time(),
            ]);

        $ok !== false ? $this->success('保存成功') : $this->error('保存失败');
    }

    /**
     * @NodeAnotation(title="删除掉落池")
     */
    public function delete_monster_item($id)
    {
        $ok = Db::table('ul_kill_gw_item')->delete($id);
        return json($ok ? ['code' => 1, 'msg' => '删除成功'] : ['code' => 0, 'msg' => '删除失败']);
    }

    /**
     * @NodeAnotation(title="修改物品属性")
     */
    public function modify_wp($id)
    {
        $field = (string)$this->request->param('field', '');
        $value = $this->request->param('value', '');

        if (!in_array($field, ['value_min', 'value_max', 'exp', 'mark'])) {
            $this->error('不允许修改该字段');
        }

        $row = Db::table('hz_kill_wp')->find($id);
        if (!$row) {
            $this->error('数据不存在');
        }

        $updateData = [];

        if ($field === 'value_min' || $field === 'value_max') {
            $value = (float)$value;
            if ($value < 0) {
                $this->error('价值不能为负数');
            }

            $newMin = $field === 'value_min' ? $value : (float)$row['value_min'];
            $newMax = $field === 'value_max' ? $value : (float)$row['value_max'];

            if ($newMin > $newMax) {
                $this->error('价值区间不正确');
            }

            $updateData[$field] = $value;
        } elseif ($field === 'exp') {
            $value = (int)$value;
            if ($value < 0) {
                $this->error('经验值不能为负数');
            }
            $updateData[$field] = $value;
        } elseif ($field === 'mark') {
            $updateData[$field] = trim((string)$value);
        }

        $ok = Db::table('hz_kill_wp')
            ->where('id', $id)
            ->update($updateData);

        $ok !== false ? $this->success('保存成功') : $this->error('保存失败');
    }

    /**
     * @NodeAnotation(title="回收记录")
     */
    public function recycle_log()
    {
        if ($this->request->isAjax()) {
            $page = (int)$this->request->param('page', 1);
            $limit = (int)$this->request->param('limit', 10);
            $openId = trim((string)$this->request->param('open_id', ''));

            $query = Db::table('ul_user_item_bag_log')
                ->where('biz_type', 'recycle');

            if ($openId !== '') {
                $query->where('open_id', $openId);
            }

            $count = (clone $query)->count();
            $list = $query
                ->order($this->sort)
                ->page($page, $limit)
                ->select()
                ->toArray();

            // 查询物品信息
            $itemIds = array_unique(array_column($list, 'item_id'));
            $itemMap = [];
            if (!empty($itemIds)) {
                $itemRows = Db::table('hz_kill_wp')
                    ->field('id,title,exp,mark')
                    ->whereIn('id', $itemIds)
                    ->select()
                    ->toArray();

                foreach ($itemRows as $item) {
                    $itemMap[(int)$item['id']] = $item;
                }
            }

            // 补充物品信息
            foreach ($list as &$row) {
                $itemId = (int)$row['item_id'];
                $item = $itemMap[$itemId] ?? null;
                $row['item_title'] = $item ? $item['title'] : '';
                $row['exp'] = $item ? (int)$item['exp'] : 0;
                $row['mark'] = $item ? $item['mark'] : '';
            }
            unset($row);

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch('recycle_log');
    }
}