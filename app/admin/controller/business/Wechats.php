<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use think\facade\Db;
use app\cq\controller\Wechat;

class Wechats extends AdminController
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $data1['qq']= $this->request->param('qq');
            $data2['redirect_url']= $this->request->param('redirect_url');
            $list1 = Db::table('basic')->where('name', 'basic')->find();
            $list2 = Db::table('api_config')->where('id', 1)->find();
            $wechat = new Wechat($this->app);
            if($data1['qq'] != $list1['qq']){
                $save1 = Db::table('basic')->where('name', 'basic')->update($data1);
            }
            if($data2['redirect_url'] != $list2['redirect_url']){
                $save2 = Db::table('api_config')->where('id', 1)->update($data2);
            }
            return json(['code'=>1,'msg'=>'生成成功']);
        }
        $list1 = Db::table('basic')->where('name', 'basic')->find();
        $list2 = Db::table('api_config')->where('id', 1)->find();
        return $this->fetch('index', ['list1' => $list1,'list2'=>$list2]);
    }
}