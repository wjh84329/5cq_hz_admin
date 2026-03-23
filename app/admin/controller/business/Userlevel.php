<?php


namespace app\admin\controller\business;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Userlevel extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $tol=($page-1)*$limit+1;
            $count = Db::table('ul_user_level')->count();
            $list = Db::table('ul_user_level')
                ->page($page, $limit)
                ->order($this->sort)
                ->select();
            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    public function edit($id)
    {
        $list = Db::table('ul_user_level')->find($id);
        if ($this->request->isPost()) {
//            $data= $this->request->param();
            $data['level_name']= $this->request->param('level_name');
            $data['level']= $this->request->param('level');
            $data['tb']= $this->request->param('tb');
            $data['level_time']= $this->request->param('level_time');
            $data['coin_up']= $this->request->param('coin_up');
            $data['coin_scale']= $this->request->param('coin_scale');
            if(Db::table('ul_user_level')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }

    public function add(){
        if ($this->request->isPost()) {
            $data['level_name']= $this->request->param('level_name');
            $data['level']= $this->request->param('level');
            $data['tb']= $this->request->param('tb');
            $data['level_time']= $this->request->param('level_time');
            $data['coin_up']= $this->request->param('coin_up');
            $data['coin_scale']= $this->request->param('coin_scale');
            if(Db::table('ul_user_level')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }

    public function delete($id){
        if(Db::table('ul_user_level')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    /**
     * @NodeAnotation(title="怪物池")
     */
    public function monster_pool($id)
    {
        $level = Db::table('ul_user_level')->find($id);
        if (!$level) {
            $this->error('等级不存在');
        }

        if ($this->request->isAjax()) {
            $page = (int)$this->request->param('page', 1);
            $limit = (int)$this->request->param('limit', 10);

            $count = Db::table('ul_user_level_kill_gw')
                ->where('level_id', $id)
                ->count();

            // 1. 先查关联表（分页）
            $relList = Db::table('ul_user_level_kill_gw')
                ->field('id,level_id,gw_id,probability,sort')
                ->where('level_id', $id)
                ->order('sort asc, id asc')
                ->page($page, $limit)
                ->select()
                ->toArray();

            // 2. 批量拿 gw_id
            $gwIds = array_values(array_unique(array_map(function ($v) {
                return (int)($v['gw_id'] ?? 0);
            }, $relList)));

            // 3. 批量查怪物表，做 map（避免 N+1）
            $gwMap = [];
            if (!empty($gwIds)) {
                $gwRows = Db::table('hz_kill_gw')
                    ->field('id,title,images')
                    ->whereIn('id', $gwIds)
                    ->select()
                    ->toArray();

                foreach ($gwRows as $g) {
                    $gid = (int)($g['id'] ?? 0);
                    $gwMap[$gid] = [
                        'title' => $this->cleanUtf8((string)($g['title'] ?? '')),
                        'images' => $this->cleanUtf8((string)($g['images'] ?? '')),
                    ];
                }
            }

            // 4. 合并数据
            $list = [];
            foreach ($relList as $r) {
                $gid = (int)($r['gw_id'] ?? 0);
                $gw = $gwMap[$gid] ?? ['title' => '', 'images' => ''];

                $list[] = [
                    'id' => (int)($r['id'] ?? 0),
                    'level_id' => (int)($r['level_id'] ?? 0),
                    'gw_id' => $gid,
                    'probability' => (int)($r['probability'] ?? 0),
                    'sort' => (int)($r['sort'] ?? 0),
                    'title' => $gw['title'],
                    'images' => $gw['images'],
                ];
            }

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch('monster_pool', ['level' => $level]);
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
     * @NodeAnotation(title="添加怪物到怪物池")
     */
    public function add_monster($id)
    {
        $level = Db::table('ul_user_level')->find($id);
        if (!$level) {
            $this->error('等级不存在');
        }

        if ($this->request->isPost()) {
            $gwIds = trim((string)$this->request->param('gw_ids', ''));
            $defaultProbability = (int)$this->request->param('default_probability', 0);

            if ($gwIds === '') {
                return json(['code' => 0, 'msg' => '请选择怪物']);
            }

            if ($defaultProbability < 0) {
                return json(['code' => 0, 'msg' => '默认概率不能小于0']);
            }

            $gwIdList = array_unique(array_filter(array_map('intval', explode(',', $gwIds))));
            $insertData = [];
            $time = time();

            foreach ($gwIdList as $gwId) {
                $exists = Db::table('ul_user_level_kill_gw')
                    ->where('level_id', $id)
                    ->where('gw_id', $gwId)
                    ->find();

                if (!$exists) {
                    $insertData[] = [
                        'level_id' => $id,
                        'gw_id' => $gwId,
                        'probability' => $defaultProbability,
                        'sort' => 0,
                        'create_time' => $time,
                        'update_time' => $time,
                    ];
                }
            }

            if (empty($insertData)) {
                return json(['code' => 0, 'msg' => '所选怪物已全部存在']);
            }

            $ok = Db::table('ul_user_level_kill_gw')->insertAll($insertData);

            return json($ok ? ['code' => 1, 'msg' => '添加成功，请回列表调整每个怪物概率'] : ['code' => 0, 'msg' => '添加失败']);
        }

        return $this->fetch('add_monster', ['level' => $level]);
    }

    /**
     * @NodeAnotation(title="修改怪物池")
     */
    public function modify_monster($id)
    {
        $field = (string)$this->request->param('field', '');
        $value = $this->request->param('value', 0);

        if (!in_array($field, ['probability', 'sort'])) {
            $this->error('不允许修改该字段');
        }

        $value = (int)$value;
        if ($value < 0) {
            $this->error('数值不能小于0');
        }

        $save = Db::table('ul_user_level_kill_gw')
            ->where('id', $id)
            ->update([
                $field => $value,
                'update_time' => time(),
            ]);

        if ($save !== false) {
            $this->success('保存成功');
        }

        $this->error('保存失败');
    }

    /**
     * @NodeAnotation(title="删除怪物池怪物")
     */
    public function delete_monster($id)
    {
        $ok = Db::table('ul_user_level_kill_gw')->delete($id);
        return json($ok ? ['code' => 1, 'msg' => '删除成功'] : ['code' => 0, 'msg' => '删除失败']);
    }

    /**
     * @NodeAnotation(title="批量配置怪物池")
     */
    public function batch_pool($id = '')
    {
        if ($this->request->isPost()) {
            $levelIdsStr = trim((string)$this->request->param('level_ids', ''));
            $gwIds = $this->request->param('gw_ids/a', []);
            $prob = $this->request->param('prob/a', []);

            $levelIds = array_unique(array_filter(array_map('intval', explode(',', $levelIdsStr))));
            $gwIds = array_unique(array_filter(array_map('intval', (array)$gwIds)));

            if (empty($levelIds)) {
                return json(['code' => 0, 'msg' => '请先选择等级']);
            }
            if (empty($gwIds)) {
                return json(['code' => 0, 'msg' => '请至少选择一个怪物']);
            }

            $insertData = [];
            $time = time();

            foreach ($levelIds as $levelId) {
                foreach ($gwIds as $gwId) {
                    $p = isset($prob[$gwId]) ? (int)$prob[$gwId] : 0;
                    if ($p < 0) {
                        return json(['code' => 0, 'msg' => '概率不能小于0']);
                    }
                    $insertData[] = [
                        'level_id' => $levelId,
                        'gw_id' => $gwId,
                        'probability' => $p,
                        'sort' => 0,
                        'create_time' => $time,
                        'update_time' => $time,
                    ];
                }
            }

            Db::startTrans();
            try {
                Db::table('ul_user_level_kill_gw')->whereIn('level_id', $levelIds)->delete();
                Db::table('ul_user_level_kill_gw')->insertAll($insertData);
                Db::commit();
                return json(['code' => 1, 'msg' => '保存成功']);
            } catch (\Throwable $e) {
                Db::rollback();
                return json(['code' => 0, 'msg' => '保存失败：' . $e->getMessage()]);
            }
        }

        $levelIdsStr = trim((string)$id);
        $levelIds = array_unique(array_filter(array_map('intval', explode(',', $levelIdsStr))));
        if (empty($levelIds)) {
            $this->error('请先在上个页面勾选等级');
        }

        $levels = Db::table('ul_user_level')
            ->field('id,level_name,level')
            ->whereIn('id', $levelIds)
            ->order('level asc,id asc')
            ->select()
            ->toArray();

        $monsters = Db::table('hz_kill_gw')
            ->field('id,title,images')
            ->order('id desc')
            ->select()
            ->toArray();

        return $this->fetch('batch_pool', [
            'level_ids' => implode(',', $levelIds),
            'levels' => $levels,
            'monsters' => $monsters,
        ]);
    }
}
