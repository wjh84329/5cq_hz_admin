<?php

namespace app\admin\controller\game;

use app\common\controller\AdminController;
use think\facade\Db;

class Fb extends AdminController
{
    public function index(){
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $id = $this->request->param('id');
            $username = Db::table("ul_system_admin")->where('id',$id)->value('username');
            $count = Db::table('xftj')->where('addUser',$username)->count();
            $list = Db::table('xftj')
                ->where('addUser',$username)
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
    public function delete($id){
        if(Db::table('xftj')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
}