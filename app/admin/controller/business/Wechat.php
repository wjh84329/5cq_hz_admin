<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use think\facade\Db;
use app\cq\controller\Wechat as chat;

class Wechat extends AdminController
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $data1['qq']= $this->request->param('qq');
            $data2['redirect_url']= $this->request->param('redirect_url');
            $save1 = Db::table('basic')->where('name', 'basic')->update($data);
            $save2 = Db::table('basic')->where('name', 'basic')->update($data);
            if($save1 && $save2){
                return json(['code'=>1,'msg'=>'生成成功']);

            }else{
                return json(['code'=>0,'msg'=>'生成失败']);
            }

        }
        $list1 = Db::table('basic')->where('name', 'basic')->find();
        $list2 = Db::table('api_config')->where('id', 1)->find();
        return $this->fetch('index', ['list1' => $list1,'list2'=>$list2]);
    }
}