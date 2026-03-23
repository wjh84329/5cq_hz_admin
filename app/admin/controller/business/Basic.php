<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use app\Request;
use think\facade\Db;
use think\helper\Str;
use think\Model;
use app\admin\model\BusinessBasic;

class Basic extends AdminController
{
    public function index(){
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
//            $list = BusinessBasic::select();
            $list = Db::table('basic')->select();
            $count = 1;
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

    /*
     * 基础信息编辑
     * */
    public function edit(){
        if ($this->request->isAjax()) {
            $data['smsCode']= $this->request->param('smsCode');
            $data['sbkBanner']= $this->request->param('sbkBanner');
            $data['qq']= $this->request->param('qq');
            $data['wechatQf']= $this->request->param('wechatQf');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('basic')->where('name', 'basic')->update($data)){
                return json(['code'=>1,'msg'=>'保存成功']);
            }else{
                return json(['code'=>0,'msg'=>'保存失败']);
            }

        }
        $list = Db::table('basic')->where('name', 'basic')->find();
        return $this->fetch('edit', ['list' => $list]);
    }

    public function save(){
        $data            = $this->request->param();
        if (Db::table('basic')->where('name', 'basic')->update($data) !== false) {
            $this->success('提交成功');
        } else {
            $this->error('提交失败');
        }
    }

}