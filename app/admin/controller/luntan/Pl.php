<?php


namespace app\admin\controller\luntan;


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
class Pl extends AdminController
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $count = Db::table('tz_pl')->count();
            $list = Db::table('tz_pl')
                ->page($page, $limit)
                ->order($this->sort)
                ->select()->toArray();
            foreach ($list as $k => $v){
                $file_list = Db::table('fbtz')->where('id',$v['tz_id'])->find();
                $userinfo = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
                $list[$k]['tz_title'] = $file_list['title'];
                $list[$k]['plr'] = isset($userinfo['nickname'])&&!empty($userinfo['nickname'])?$userinfo['nickname']:'微信用户';
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

    /**
     * @NodeAnotation(title="审核")
     */
    public function stock($id)
    {
        $list = Db::table('tz_pl')->find($id);
        if ($this->request->isPost()) {
            $data= $this->request->param();
            if(Db::table('tz_pl')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('stock',['list'=>$list]);
    }


    public function delete($id){
        if(Db::table('tz_pl')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function edit($id){
        $info = Db::table('tz_pl')->find($id);
        if ($this->request->isPost()) {
            $data= $this->request->param();
            if(Db::table('tz_pl')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$info]);
    }
}
