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
class Yxlb extends AdminController
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
            $count = Db::table('ul_yxlb')->count();
            $list = Db::table('ul_yxlb')
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
        $list = Db::table('ul_yxlb')->find($id);
        $fl_list = Db::table('yxfl')->select();
        if ($this->request->isPost()) {
            $data['yx_name']= $this->request->param('yx_name');
            $data['yx_banner']= $this->request->param('yx_banner');
            $data['yxlogo']= $this->request->param('yxlogo');
            $data['yxgs']= $this->request->param('yxgs');
            $data['zylx']= $this->request->param('zylx');
            $data['yxyy']= $this->request->param('yxyy');
            $data['yxbb']= $this->request->param('yxbb');
            $data['yxdx']= $this->request->param('yxdx');
            $data['xzcs']= $this->request->param('xzcs');
            $data['yxjj']= $this->request->param('yxjj');
            $data['xzlj']= $this->request->param('xzlj');
            $data['is_tj']= $this->request->param('is_tj');
            $data['is_rm']= $this->request->param('is_rm');
            $data['is_sy']= $this->request->param('is_sy');
            $data['xq']= htmlspecialchars_decode($this->request->param('xq'));
            if($list['is_ts']==0){
                $data['yxgw']= $this->request->param('yxgw');
                $data['yxjt']= $this->request->param('yxjt');
                $data['yxbq']= $this->request->param('yxbq');
                $data['kfsj']= $this->request->param('kfsj');
                $data['is_zs']= $this->request->param('is_zs');
                $data['engine']= $this->request->param('engine');
                $data['list']= $this->request->param('list');
            }
//            $data['smsCode']= $this->request->param('smsCode');
//            return json($id);
            if(Db::table('ul_yxlb')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list,'fl_list'=>$fl_list]);
    }

    public function add(){
        $fl_list = Db::table('yxfl')->select();
        if ($this->request->isPost()) {
            $data['yx_name']= $this->request->param('yx_name');
            $data['yxlogo']= $this->request->param('yxlogo');
            $data['yx_banner']= $this->request->param('yx_banner');
            $data['yxgs']= $this->request->param('yxgs');
            $data['zylx']= $this->request->param('zylx');
            $data['yxyy']= $this->request->param('yxyy');
            $data['yxbb']= $this->request->param('yxbb');
            $data['yxdx']= $this->request->param('yxdx');
            $data['xzcs']= $this->request->param('xzcs');
            $data['yxjj']= $this->request->param('yxjj');
            $data['xzlj']= $this->request->param('xzlj');
            $data['is_tj']= $this->request->param('is_tj');
            $data['is_rm']= $this->request->param('is_rm');
            $data['is_sy']= $this->request->param('is_sy');
            $data['xq']= htmlspecialchars_decode($this->request->param('xq'));
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_yxlb')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch('add',['fl_list'=>$fl_list]);
    }

    public function add_ts(){
        $fl_list = Db::table('yxfl')->select();
        if ($this->request->isPost()) {
            $data['yx_name']= $this->request->param('yx_name');
            $data['yxlogo']= $this->request->param('yxlogo');
            $data['yx_banner']= $this->request->param('yx_banner');
            $data['yxgs']= $this->request->param('yxgs');
            $data['zylx']= $this->request->param('zylx');
            $data['yxyy']= $this->request->param('yxyy');
            $data['yxbb']= $this->request->param('yxbb');
            $data['yxdx']= $this->request->param('yxdx');
            $data['xzcs']= $this->request->param('xzcs');
            $data['yxjj']= $this->request->param('yxjj');
            $data['xzlj']= $this->request->param('xzlj');
            $data['is_tj']= $this->request->param('is_tj');
            $data['is_rm']= $this->request->param('is_rm');
            $data['is_sy']= $this->request->param('is_sy');
            $data['is_zs']= $this->request->param('is_zs');
            $data['yxgw']= $this->request->param('yxgw');
            $data['yxjt']= $this->request->param('yxjt');
            $data['yxbq']= $this->request->param('yxbq');
            $data['kfsj']= $this->request->param('kfsj');
            $data['pf']= $this->request->param('pf');
            $data['engine']= $this->request->param('engine');
            $data['list']= $this->request->param('list');
            $data['is_ts']= 0;
            $data['xq']= htmlspecialchars_decode($this->request->param('xq'));
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_yxlb')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch('add_ts',['fl_list'=>$fl_list]);
    }

    public function delete($id){
        if(Db::table('ul_yxlb')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    /*
     * 热门游戏列表
     * */
    public function rm_yx_list(){
        $list = Db::table('ul_yxlb')->where('is_rm',0)->select();
        if($list){
            $data = array(
                'code'=>200,
                'msg'=>'成功',
                'list'=>$list
            );
            return json($data);
        }else{
            return json(['code'=>0,'msg'=>'获取失败']);
        }

    }
}
