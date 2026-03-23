<?php

namespace app\admin\controller;

use app\common\controller\AdminController;
use think\facade\Db;

class Tj extends AdminController
{
    public function tj(){
        $data = $this->request->param();
        //系统实时在线人数
        $data['zxrs'] = Db::table('ul_order_user')->where('is_online',0)->count();
        //获取总安装数
        $data['zazs'] = Db::table('hz_step')->count();
        //获取今日安装数
        $data['jraz'] = Db::table('hz_step')->whereTime('add_time','today')->count();
        //获取时间段内的安装数
//        $data['draz'] = Db::table('hz_step')->whereTime('add_time','between',[$data['start'].' 00:00:00',$data['end'].' 23:59:59'])->count();
//        $data['draz'] = Db::table('hz_step')->whereBetweenTime('add_time',$data['start'].' 00:00:00',$data['end'].' 23:59:59')->count();
        $data['draz'] = Db::table('hz_step')->whereTime('add_time','between',[$data['start'],$data['end']])->count();
        $sql = Db::table('hz_step')->getLastSql();
        echo $sql;
        echo '111';
    }
}