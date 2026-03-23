<?php

namespace app\admin\controller\game;

use app\common\controller\AdminController;
use app\admin\traits\Curd;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\App;
use think\facade\Db;
/**
 * Class User
 * @package app\admin\controller\game
 * @ControllerAnnotation(title="游戏列表")
 */
class User extends AdminController
{
    /**
     * @NodeAnotation(title="会员管理")
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
            $count = Db::table('ul_system_admin')->where('auth_ids',6)->count();
            $list = Db::table('ul_system_admin')
                ->where('auth_ids',6)
                ->page($page, $limit)
                ->order($this->sort)
                ->order('sort desc')
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
    /**
     * @NodeAnotation(title="添加会员")
     */
    public function add(){
        if ($this->request->isPost()) {
            $data['username']= $this->request->param('username');
            $data['password']= password($this->request->param('password'));
            $data['type']= $this->request->param('type');
            $data['phone']= $this->request->param('phone');
            $data['realname']= $this->request->param('realname');
            $data['QQ']= $this->request->param('QQ');
            $data['email']= $this->request->param('email');
            $data['money']= $this->request->param('money');
            $data['credit']= $this->request->param('credit');
            $data['auth_ids']= 6;
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_system_admin')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }
    /**
     * @NodeAnotation(title="编辑会员")
     */
    public function edit($id)
    {
        $list = Db::table('ul_system_admin')->find($id);
        if ($this->request->isPost()) {
            $data['username']= $this->request->param('username');
            if(!empty($this->request->param('password'))){
                $data['password']= password($this->request->param('password'));
            }
            $data['type']= $this->request->param('type');
            $data['phone']= $this->request->param('phone');
            $data['realname']= $this->request->param('realname');
            $data['QQ']= $this->request->param('QQ');
            $data['email']= $this->request->param('email');
            $data['money']= $this->request->param('money');
            $data['credit']= $this->request->param('credit');
            $data['auth_ids']= 6;
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_system_admin')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }
    /**
     * @NodeAnotation(title="删除会员")
     */
    public function delete($id){
        if(Db::table('ul_system_admin')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
    public function jia($id){
        $list = Db::table('ul_system_admin')->find($id);
        if ($this->request->isPost()) {
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_system_admin')->where('id',$id)->inc('money',$this->request->param('number'))->update()){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('jia',['list'=>$list]);
    }
    public function jian($id){
        $list = Db::table('ul_system_admin')->find($id);
        if ($this->request->isPost()) {
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_system_admin')->where('id',$id)->dec('money',$this->request->param('number'))->update()){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('jian',['list'=>$list]);
    }
}