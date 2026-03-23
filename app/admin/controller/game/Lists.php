<?php

namespace app\admin\controller\game;

use app\common\controller\AdminController;
use app\admin\traits\Curd;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\App;
use think\facade\Db;
use DateTime;
/**
 * Class User
 * @package app\admin\controller\game
 * @ControllerAnnotation(title="游戏列表")
 */
class Lists extends AdminController
{
    /**
     * @NodeAnotation(title="游戏管理")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
//            $page = $this->request->param('page');
//            $where = $this->request->param('op');
//            $limit = $this->request->param('limit');
            $tol=($page-1)*$limit+1;
            $count = Db::table('xftj')->where($where)->count();
            $list = Db::table('xftj')
                ->where($where)
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
    /**
     * @NodeAnotation(title="添加游戏")
     */
    public function add(){
        if ($this->request->isPost()) {
            $user = session('admin');
            $operation = Db::table('operation')->find(1);
            $data = $this->request->param();
            $lines = explode(PHP_EOL,$data['text']);
            $result = [];
            foreach ($lines as $line) {
                // 忽略空行或只有分隔符的行
                if (trim($line) === '') {
                    continue;
                }

                // 按冒号分割每一行
                list($key, $value) = explode('：', $line, 2); // 注意：这里使用全角冒号

                // 去除键和值两端的空白字符
                $key = trim($key);
                $value = trim($value);
                // 将键值对添加到结果数组中
                $result[$key] = $value;
            }
            if($data['opendata'] != "自动获取开区时间"){
                $insertdata['startTime'] = $data['opendata'];
                $dateTime = new \DateTime($data['opendata']);
            }else{
                $dateTime = new \DateTime('now');
            }
            $dateTime->modify('+'.$data['days'].' day');
            $insertdata['expiresTime'] = $dateTime->format('Y-m-d H:i:s');
            $insertdata['serverName'] = $result['服务器名'];
            $insertdata['serverIp'] = $result['服务器IP'];
            $insertdata['openTime'] = $result['开区时间'];
            $insertdata['QQ'] = $result['客服QQ号'];
            $insertdata['route'] = $result['线路类别'];
            $insertdata['version'] = $result['版本介绍'];
            $insertdata['homeUrl'] = $result['主页地址'];
            $insertdata['listUrl'] = $result['列表地址'];
            $insertdata['engine'] = $data['engine'];
            $insertdata['show'] = $data['show'];
            $insertdata['addUser'] = $user['username'];
            $insertdata['days'] = $data['days'];
            $insertdata['cmoney'] = $operation['reduce']*$data['days']*$data['num'];
            $insertdata['num'] = $data['num'];
//            $successCount = 0;
            /*for ($i = 0;$i<$data['num'];$i++){
                if(Db::table('xftj')->insert($insertdata)){
                    $successCount++;
                }
            }*/
            if(Db::table('xftj')->insert($insertdata)){
                if($user['username'] != 'admin'){
                    Db::table('ul_system_admin')->where('id',$user['id'])->dec('money',$data['num']*$operation['reduce']*$data['days'])->update();
                }
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }

//            return json(['code'=>1,'msg'=>'添加成功'.$successCount.'条']);
        }
        return $this->fetch();
    }
    /**
     * @NodeAnotation(title="编辑游戏")
     */
    public function edit($id)
    {
        $list = Db::table('xftj')->find($id);
        if ($this->request->isPost()) {
            $data = $this->request->param();
            $dateTime = new \DateTime($data['expiresTime']);
            if($data['add']==0){
                $dateTime->modify('+'.$data['days'].' day');
            }else{
                $dateTime->modify('-'.$data['days'].' day');
            }
            $savedata['serverName'] = $data['serverName'];
            $savedata['serverIp'] = $data['serverIp'];
            $savedata['openTime'] = $data['openTime'];
            $savedata['QQ'] = $data['QQ'];
            $savedata['route'] = $data['route'];
            $savedata['version'] = $data['version'];
            $savedata['homeUrl'] = $data['homeUrl'];
            $savedata['listUrl'] = $data['listUrl'];
            $savedata['engine'] = $data['engine'];
            $savedata['show'] = $data['show'];
            $savedata['num'] = $data['num'];
            $savedata['state'] = $data['state'];
            $savedata['downUrl'] = $data['downUrl'];
            $savedata['expiresTime'] = $dateTime->format('Y-m-d H:i:s');
            $savedata['createTime'] = date('Y-m-d H:i:s');
            if($list['state']==3 && $data['state']==0){
                // 假设的时间a
                $timeA = new DateTime($list['createTime']);

                // 获取当前时间b
                $timeB = new DateTime();

                // 假设的时间c
                $timeC = new DateTime($list['expiresTime']);

                // 计算时间a与时间b之间的差异
                $interval = $timeA->diff($timeB);

                // 将差值加到时间c上
                $timeC->add($interval);

                $savedata['expiresTime'] = $timeC->format('Y-m-d H:i:s');
            }
            if(Db::table('xftj')->where('id',$id)->update($savedata)){
                if($list['state']==2 && $data['state']==0){
                    Db::table('ul_system_admin')->where('username',$list['addUser'])->inc('money',$list['cmoney'])->update();
                }
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
//            return json($data);
        }
        return $this->fetch('edit',['list'=>$list]);
    }
    /**
     * @NodeAnotation(title="删除游戏")
     */
    public function delete($id){
        if(Db::table('xftj')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
    /**
     * 撤销游戏
     */
    public function cx($id){
//        $user = session('admin');
        $listinfo = Db::table('xftj')->find($id);
        $givenDateTimeObj = new \DateTime($listinfo['startTime']);
        // 获取当前时间
        $now = new \DateTime();
        // 比较给定的时间是否大于当前时间
        if ($givenDateTimeObj < $now) {
            return json(['code'=>0,'msg'=>'广告已开始，无法撤销']);
        } else {
            if($listinfo['addUser'] == 'admin' || $listinfo['addUser'] == '' || $listinfo['addUser'] == null){
                $update = Db::table('xftj')->where('id',$id)->update(['state'=>2]);
                if($update){
                    return json(['code'=>1,'msg'=>'撤销成功']);
                }else{
                    return json(['code'=>0,'msg'=>'撤销失败，请重试']);
                }
            }else{
                $save = Db::table('ul_system_admin')->where('username',$listinfo['addUser'])->inc('money',floatval($listinfo['cmoney']))->update();
                if($save){
                    $update = Db::table('xftj')->where('id',$id)->update(['state'=>2]);
                    if($update){
                        return json(['code'=>1,'msg'=>'撤销成功']);
                    }else{
                        return json(['code'=>0,'msg'=>'撤销失败，请重试']);
                    }
                }else{
                    return json(['code'=>0,'msg'=>'撤销失败，请重试']);
                }
            }
        }

    }
    public function zt($id){
//        $info = Db::table('xftj')->find($id);
        $save = Db::table('xftj')->where('id',$id)->update(['state'=>0,'createTime'=>date('Y-m-d H:i:s')]);
        if($save){
            return json(['code'=>1,'msg'=>'暂停成功']);
        }else{
            return json(['code'=>0,'msg'=>'暂停失败，请重试']);
        }
    }
}