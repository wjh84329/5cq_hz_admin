<?php


namespace app\admin\controller\coin;


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
class Order extends AdminController
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
            $limit = $this->request->param('$limit');
//            $tol=($page-1)*$limit+1;
            $count = Db::table('ul_coin_order')->count();
            $list = Db::table('ul_coin_order')
                ->page($page, $limit)
                ->order($this->sort)
                ->order('order_time desc')
                ->select()->toArray();
            foreach ($list as $key => $value){
                if($value['order_type']==0){
                    $list[$key]['type'] = '实物';
                }elseif ($value['order_type']==1){
                    $list[$key]['type'] = '虚拟';
                }else{
                    $list[$key]['type'] = '抽奖';
                }
                if($value['order_statu']==0){
                    $list[$key]['statu'] = '待发货';
                }elseif ($value['order_statu']==1){
                    $list[$key]['statu'] = '已发货';
                }elseif ($value['order_statu']==2){
                    $list[$key]['statu'] = '已收货';
                }else{
                    $list[$key]['statu'] = '待补充收货信息';
                }

            }
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
        $list = Db::table('ul_coin_order')->find($id);
        if ($this->request->isPost()) {
            $data['consignee_name']= $this->request->param('consignee_name');
            $data['consignee_phone']= $this->request->param('consignee_phone');
            $data['consignee_address']= $this->request->param('consignee_address');
            $data['consignee_code']= $this->request->param('consignee_code');
            $data['courier_number']= $this->request->param('courier_number');
            $data['order_type']= $this->request->param('order_type');
            $data['order_statu']= $this->request->param('order_statu');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_coin_order')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }

    public function delete($id){
        if(Db::table('ul_coin_order')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function test(){
        $list = Db::table('ul_coin_order')
            ->order('order_time desc')
            ->select()->toArray();
        foreach ($list as $key => $value){
            if($value['order_type']==0){
                $list[$key]['type'] = '抽奖';
            }elseif ($value['order_type']==1){
                $list[$key]['type'] = '虚拟';
            }else{
                $list[$key]['type'] = '实物';
            }
            if($value['order_statu']==0){
                $list[$key]['statu'] = '代发货';
            }elseif ($value['order_statu']==1){
                $list[$key]['statu'] = '已发货';
            }elseif ($value['order_statu']==2){
                $list[$key]['statu'] = '已收货';
            }else{
                $list[$key]['statu'] = '待补充收货信息';
            }

        }
        dump($list);
    }
}
