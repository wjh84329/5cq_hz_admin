<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use app\Request;
use think\facade\Db;
use think\helper\Str;
use think\Model;
use app\admin\model\BusinessConfig;

class H5 extends AdminController
{
    public function index(){
        $info = Db::table('h5_config')->find(1);
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            if($data['name'] == 'fwxy'){
                $save = Db::table('h5_config')->where('id',1)->update(['fwxy'=>htmlspecialchars_decode($this->request->param('fwxy'))]);
            }elseif ($data['name'] == 'yszc'){
                $save = Db::table('h5_config')->where('id',1)->update(['yszc'=>htmlspecialchars_decode($this->request->param('yszc'))]);
            }elseif ($data['name'] == 'djjs'){
                $save = Db::table('h5_config')->where('id',1)->update(['djjs'=>htmlspecialchars_decode($this->request->param('djjs'))]);
            }
            if ($save !== false) {
                $this->success('提交成功');
            } else {
                $this->error('提交失败');
            }
        }
        return $this->fetch('index',['info'=>$info]);
    }
}