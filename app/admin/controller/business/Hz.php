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
class Hz extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $count = Db::table('hzlm')->count();
            $list = Db::table('hzlm')
                ->order($this->sort)
                ->page($page, $limit)
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
    public function modify($id){
        $data = $this->request->param();
        $save = Db::table('hzlm')->where('id',$id)->update([$data['field']=>$data['value']]);
        if($save){
            $this->success('保存成功');
        }
//        $this->success('保存成功');
    }
}
