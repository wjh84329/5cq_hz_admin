<?php

namespace app\admin\controller;


use app\admin\model\SystemAdmin;
use app\admin\model\SystemQuick;
use app\common\controller\AdminController;
use think\App;
use think\cache\driver\Redis;
use think\facade\Db;
use think\facade\Env;

class Index extends AdminController
{

    /**
     * 后台主页
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        return $this->fetch('', [
            'admin' => session('admin'),
        ]);
    }

    /**
     * 后台欢迎页
     * @return string
     * @throws \Exception
     */
    public function welcome()
    {
        $user_count = Db::table('ul_order_user')->count();
        $goods_count = Db::table('ul_coin_goods')->count();
        $order_count = Db::table('ul_coin_order')->count();
        $quicks = SystemQuick::field('id,title,icon,href')
            ->where(['status' => 1])
            ->order('sort', 'desc')
            ->autoCache('welcome_list')
            ->limit(8)
            ->select();
        $this->assign('quicks', $quicks);
        $redis = new Redis();
        $prefix = 'user_';
        $keys = $redis->keys($prefix.'*');
        $list = [];
        //去除user_前缀
        foreach ($keys as $k=>$v){
            $open_id= substr($v,5);
            $list[$k] = Db::table('ul_order_user')->where('open_id',$open_id)->findOrEmpty();
        }
        return $this->fetch('welcome',['user_count'=>$user_count,'goods_count'=>$goods_count,'order_count'=>$order_count,'loginlist'=>$list]);
    }

    /**
     * 修改管理员信息
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function editAdmin()
    {
        $id = session('admin.id');
        $row = (new SystemAdmin())
            ->withoutField('password')
            ->find($id);
        empty($row) && $this->error('用户信息不存在');
        if ($this->request->isPost()) {
            $post = $this->request->post();
//            $this->isDemo && $this->error('演示环境下不允许修改');
            $rule = [];
            $this->validate($post, $rule);
            try {
                $save = $row
                    ->allowField(['head_img', 'phone', 'remark', 'update_time'])
                    ->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            $save ? $this->success('保存成功') : $this->error('保存失败');
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    /**
     * 修改密码
     * @return string
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function editPassword()
    {
        $id = session('admin.id');
        $row = (new SystemAdmin())
            ->withoutField('password')
            ->find($id);
        if (!$row) {
            $this->error('用户信息不存在');
        }
        if ($this->request->isPost()) {
            $post = $this->request->post();
//            $this->isDemo && $this->error('演示环境下不允许修改');
            $rule = [
                'password|登录密码'       => 'require',
                'password_again|确认密码' => 'require',
            ];
            $this->validate($post, $rule);
            if ($post['password'] != $post['password_again']) {
                $this->error('两次密码输入不一致');
            }

            try {
                $save = $row->save([
                    'password' => password($post['password']),
                ]);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
        $this->assign('row', $row);
        return $this->fetch();
    }

    public function tj(){
        $data = $this->request->param();
        $redis = new Redis();
        $prefix = 'user_';
        $keys = $redis->keys($prefix.'*');
        //系统实时在线人数
//        $data['zxrs'] = Db::table('ul_order_user')->where('is_online',0)->count();
        $data['zxrs'] = count($keys);
        //获取总安装数
        $data['zazs'] = Db::table('hz_step')->count();
        //获取今日安装数
        $data['jraz'] = Db::table('hz_step')->whereTime('add_time','today')->count();
        //获取时间段内的安装数
        $data['draz'] = Db::table('hz_step')->whereTime('add_time','between',[$data['start'].' 00:00:00',$data['start'].' 23:59:59'])->count();
        return json($data);
    }
    public function onlineList(){
        $redis = new Redis();
        $prefix = 'user_';
        $keys = $redis->keys($prefix.'*');
        $list = [];
        //去除user_前缀
        foreach ($keys as $k=>$v){
            $open_id= substr($v,5);
            $keys[$k] = $open_id;
            $list[$k] = Db::table('ul_order_user')->where('open_id',$open_id)->findOrEmpty();
        }
        var_dump($keys);
        return json(['list'=>$list]);
    }
}
