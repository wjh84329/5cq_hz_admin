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
class Hb extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $count = Db::table('hb')->count();
            $list = Db::table('hb')
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

    public function edit($id)
    {
        $list = Db::table('hb')->find($id);
        if ($this->request->isPost()) {
            $data['name']= $this->request->param('name');
            $data['num']= $this->request->param('num');
            $data['price']= $this->request->param('price');
            $data['statu']= $this->request->param('statu');
            $data['fsrq']= $this->request->param('fsrq');
            $data['fssj']= $this->request->param('fssj');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('hb')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }

    public function add_gd(){
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if($data['statu']==0){
                $data['fssj'] = date('H:i:s',time());
            }else{
                $data['fssj'] = $data['fssj'];
            }
            if(Db::table('hb')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch('add_gd');
    }

    public function add_sj(){
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if(Db::table('hb')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }

    public function delete($id){
        if(Db::table('hb')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function cs(){
        $list = Db::table('cs')->select();
        return json(['code'=>1,'msg'=>'','data'=>$list]);
    }

    public function modify($id){
        $data = $this->request->param();
        $save = Db::table('hb')->where('id',$id)->update([$data['field']=>$data['value']]);
        if($save){
            $this->success('保存成功');
        }
//        $this->success('保存成功');
    }
}
