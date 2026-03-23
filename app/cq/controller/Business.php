<?php
declare (strict_types = 1);

namespace app\cq\controller;

use app\BaseController;
use Darabonba\GatewaySpi\Models\InterceptorContext\request;
use think\facade\Cache;
use think\facade\Db;
use think\facade\Log;
use app\cq\common\RedisDistributedLock;

class Business extends BaseController
{
    private $lockKey = 'my_unique_lock_key'; // 锁的唯一标识
    private $lockExpire = 60; // 锁的有效期（秒）
    
    /**
     * @OA\Post(path="/cq/business/basic",
     *   tags={"运营管理"},
     *   summary="获取基础配置",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/basic"),
     *             },
     *         )
     *     )
     * )
     */
    public function basic(){
        $list = basic_info();
        return json(['code'=>200,'msg'=>'获取基础配置','data'=>$list]);
    }
    /**
     * @OA\Post(path="/cq/business/operation",
     *   tags={"运营管理"},
     *   summary="运营参数配置",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/operation"),
     *             },
     *         )
     *     )
     * )
     */
    public function operation(){
        $list = operation_info();
        $list1 = Db::table('hb')->where('type',0)->whereTime('updata_time','today')->select()->toArray();
        foreach ($list1 as $k1 => $v1){
            $time = date('Y-m-d',strtotime($list1[$k1]['updata_time']));
            $dateTime = strtotime("$time 23:59:59");
            /*$dateTime = new \DateTime($list1[$k1]['updata_time']);
            $dateTime->modify('+1 day');*/
            $list1[$k1]['count'] = Db::table('coin_info')->where('hb_id',$v1['id'])->count();
//            $list1[$k1]['endTime'] = $dateTime->format('Y-m-d H:i:s');
            $list1[$k1]['endTime'] = date('Y-m-d H:i:s',$dateTime);
        }
        $list2 = Db::table('hb')->where('type',1)->select()->toArray();
        foreach ($list2 as $k => $v){
            $list2[$k]['count'] = Db::table('coin_info')->where('hb_id',$v['id'])->count();
            if($list2[$k]['count'] >= $list2[$k]['num']){
                unset($list2[$k]);
            }
        }
        $lists = array_merge($list1,$list2);
        $list['hb_num'] = count($lists);
        return json(['code'=>200,'msg'=>'运营参数配置','data'=>$list]);
    }

    /**
     * @OA\Post(path="/cq/business/luckyCoin",
     *   tags={"运营管理"},
     *   summary="金币抽奖配置",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/luckyCoin"),
     *             },
     *         )
     *     )
     * )
     */
    public function luckyCoin(){
        $list = Db::table('luckyCoin')->find(1);
        return json(['code'=>200,'msg'=>'金币抽奖配置','data'=>$list]);
    }
    
    public function luckyCoinSetup(){
        $list = Db::table('luckyCoin')->find(1);
        // 初始化一个新数组来存放转换后的数据
        $items = [];
        // 假设我们知道有多少个这样的项目（在这个例子中是3个）
        for ($i = 1; $i <= 8; $i++) {
            $imgKey = "luckyCoinItemImg" . $i;
            $titleKey = "luckyCoinItemTitle" . $i;
            $numberKey = "luckyCoinItemNumber" . $i;
            $probKey = "luckyCoinItemProb" . $i;

            // 提取每个项目的信息
            $imgUrl = $list[$imgKey];
            $text = $list[$titleKey];
            $multiple = $list[$numberKey];
            $range = $list[$probKey];

            // 添加sort字段，值为当前循环的索引（从1开始）
            $sort = $i;

            // 将信息添加到新数组中
            $items[] = [
                "imgUrl" => $imgUrl,
                "text" => $text,
                "multiple" => $multiple,
                "sort" => $sort, // 注意这里使用冒号（:）来分配值
                "range" => $range,
                "state" => $sort
            ];
        }
        $data = [
            'blocksBackgroundImage' => $list['luckyCoinBackgroundImage'],
            'buttonsBackgroundImage' => $list['luckyCoinStartBtn'],
            'prizes' => $items
        ];
        return json(['code'=>200,'msg'=>'金币抽奖配置','data'=>$data]);
    }
    /**
     * @OA\Post(path="/cq/business/luckyPrize",
     *   tags={"运营管理"},
     *   summary="实物抽奖配置",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/luckyPrize"),
     *             },
     *         )
     *     )
     * )
     */
    public function luckyPrize(){
        $list = Db::table('luckyPrize')->find(1);
        return json(['code'=>200,'msg'=>'实物抽奖配置','data'=>$list]);
    }
    public function luckyPrizeSetup(){
        $list = Db::table('luckyPrize')->find(1);
        // 初始化一个新数组来存放转换后的数据
        $items = [];
        // 假设我们知道有多少个这样的项目（在这个例子中是3个）
        for ($i = 1; $i <= 8; $i++) {
            $imgKey = "luckyPrizeItemImg" . $i;
            $titleKey = "luckyPrizeItemTitle" . $i;
            $probKey = "luckyPrizeItemProb" . $i;

            // 提取每个项目的信息
            $imgUrl = $list[$imgKey];
            $text = $list[$titleKey];
            $range = $list[$probKey];

            // 添加sort字段，值为当前循环的索引（从1开始）
            $sort = $i;

            // 将信息添加到新数组中
            $items[] = [
                "imgUrl" => $imgUrl,
                "text" => $text,
                "sort" => $sort, // 注意这里使用冒号（:）来分配值
                "range" => $range,
                "state" => $sort
            ];
        }
        $data = [
            'blocksBackgroundImage' => $list['luckyPrizeBackgroundImage'],
            'buttonsBackgroundImage' => $list['luckyPrizeStartBtn'],
            'prizes' => $items
        ];
//        dump($data);
        return json(['code'=>200,'msg'=>'实物抽奖配置','data'=>$data]);
    }
    /**
     * @OA\Post(path="/cq/business/play_list",
     *   tags={"运营管理"},
     *   summary="活动列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/play"),
     *             },
     *         )
     *     )
     * )
     */
    public function play_list(){
        $list = Db::table('ul_play')->order('add_time desc')->select();
        return json(['code'=>200,'msg'=>'活动列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/business/play_info",
     *     tags={"运营管理"},
     *     summary="活动详情",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(
     *                     property="id",type="string"
     *                 ),
     *                 example={"id": "1"}
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/play"),
     *             },
     *         )
     *     )
     * )
     */
    public function play_info($id){
        $list = Db::table('ul_play')->find($id);
        return json(['code'=>200,'msg'=>'活动详情','data'=>$list]);
    }

    /**
     * @OA\Post(path="/cq/business/sbk_list",
     *   tags={"运营管理"},
     *   summary="沙巴克列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_sbk"),
     *             },
     *         )
     *     )
     * )
     */
    public function sbk_list(){
        $list = Db::table('ul_sbk')->order('add_time asc')->select()->toArray();
        foreach ($list as $k =>$v){
            $list[$k]['qs'] = '第'.($k+1).'期';
        }
        rsort($list);
        return json(['code'=>200,'msg'=>'沙巴克列表','data'=>$list]);
    }

    /**
     * @OA\Post(path="/cq/business/h5config",
     *   tags={"运营管理"},
     *   summary="h5配置",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/h5_config"),
     *             },
     *         )
     *     )
     * )
     */
    public function h5config(){
        $info = Db::table('h5_config')->find(1);
        $list = Db::table('ul_system_config')->where('id',20)->find();
        $info['version'] = $list['value'];
        return json(['code'=>200,'msg'=>'h5配置','data'=>$info]);
    }

    /**
     * @OA\Post(path="/cq/business/hb_list",
     *   tags={"运营管理"},
     *   summary="红包列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/hb"),
     *             },
     *         )
     *     )
     * )
     */
    public function hb_list(){
        $list = Db::table('hb')->select()->toArray();
        foreach ($list as $k => $v){
            $list[$k]['count'] = Db::table('coin_info')->where('hb_id',$v['id'])->count();
        }
        return json(['code'=>200,'msg'=>'红包列表','data'=>$list]);
    }

    /**
     * @OA\Post(path="/cq/business/ul_user_level",
     *   tags={"运营管理"},
     *   summary="用户等级列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_user_level"),
     *             },
     *         )
     *     )
     * )
     */
    public function ul_user_level(){
        $list = Db::table('ul_user_level')->select();
        return json(['code'=>200,'msg'=>'用户等级列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/business/update_sbk",
     *     tags={"运营管理"},
     *     summary="沙巴克更新投注量",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                 @OA\Property(property="name",type="string",description="投注方"),
     *                 @OA\Property(property="coin_num", type="float",description="数量"),
     *                 @OA\Property(property="open_id", type="string",description="用户open_id"),
     *                 example={
     *                      "id": "2",
     *                      "name": "red",
     *                      "coin_num": "200",
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_sbk"),
     *             },
     *         )
     *     )
     * )
     */
    public function update_sbk(){
        $data['sbk_id'] = $this->request->param('id');
        $name = $this->request->param('name');
        $data['fs'] = '比赛竞猜';
        $data['open_id'] = $this->request->param('open_id');
        $data['coin_num'] = floatval($this->request->param('coin_num'));
        $data['code'] = 1;
        $key_info = $this->request->time()."_".time()."_".$data['open_id'];
        $key_count = Db::table('update_sbk_key')->where('key',$key_info)->count();
        if ($key_count>0) {
                return json(['code'=>500,'msg'=>"请求频率过高"]);
        } else {
            Db::table('update_sbk_key')->where('key',$key_info)->insert(['key'=>$key_info]);
            if($name=='red'){
                $data['tz_type'] = 1;
                $save = Db::table('ul_sbk')
                    ->where('id',$data['sbk_id'])
                    ->inc('red_num',$data['coin_num'])
                    ->update();

            }else{
                $data['tz_type'] = 2;
                $save = Db::table('ul_sbk')
                    ->where('id',$data['sbk_id'])
                    ->inc('blue_num',$data['coin_num'])
                    ->update();
            }
            if($save){
                Db::table('ul_order_user')
                    ->where('open_id',$data['open_id'])
                    ->dec('coin_num',$data['coin_num'])
                    ->update();
                Db::table('coin_info')->insert($data);
                $list = Db::table('ul_sbk')->where('id',$data['sbk_id'])->find();
                $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                return json(['code'=>200,'msg'=>'沙巴克信息','data'=>$list,'userInfo'=>$user_info]);
            }else{
                return json(['code'=>0,'msg'=>'失败']);
            }
        }

    }

    /**
     * @OA\Post(
     *     path="/cq/business/sbk_rank",
     *     tags={"运营管理"},
     *     summary="获取当前用户投注数量",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                 @OA\Property(property="open_id",type="string",description="用户open_id"),
     *                 example={
     *                      "id": "2",
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             @OA\Examples(example="result", value={
     *                                              "tz_type": "投注方1红方2蓝方",
     *                                              "coin_num": "投注金额",
     *                                            }, summary="An result object."),
     *         )
     *     )
     * )
     */
    public function sbk_rank(){
        //获取投注信息
        $open_id = $this->request->param('open_id');
        $sbk_id = $this->request->param('id');
        $list = Db::table('coin_info')
            ->field('tz_type,SUM(coin_num) as coin_num')
            ->where('fs','比赛竞猜')
            ->where('open_id',$open_id)
            ->where('sbk_id',$sbk_id)
            ->group('tz_type')
            ->select()->toArray();
        /*foreach ($list as $k =>$v){
            $list[$k]['sort'] = $k+1;
            $user_info = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
            $list[$k]['nickname'] = $user_info['nickname'];
        }*/
        return json(['code'=>200,'msg'=>'当前用户投注数量','data'=>$list]);
    }

    /*
     * 获取当前用户可领取红包列表
     * */
    public function hb_lsit(){
        $open_id = $this->request->param('open_id');
        $dqsjc = time();//当前时间戳
//        $dqsj =  date('H:i:s',$dqsjc);//当前时间
        $dqrq =  date('Y-m-d',$dqsjc);//当前时间
        $number_wk = date("w",$dqsjc);//获取星期下标,
        $weekArr = array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
//        $xq =  $weekArr[$number_wk];//获取今天为星期几
        $hb_list = Db::table('hb')->select()->toArray();//获取所有红包列表
        foreach ($hb_list as $k => $v){
            $upsjc = strtotime($v['updata_time']);
                //判断是否为重复红包
            if($v['type']==0){//单次
                if($v['statu']==0){//立即发送
                    if(Db::table('coin_info')->whereTime('updata_time','today')->where('hb_id',$v['id'])->where('open_id',$open_id)->find()){
                        unset($hb_list[$k]);
                    }else{
                        if(date('Y-M-D',$dqsjc)>date('Y-M-D',$upsjc)){//已过期
                            unset($hb_list[$k]);
                        }else{//可领取
                            $hb_list[$k]['is_gq'] = 1;//可领取
                        }
                    }
                }else{//定时发送
                    if(Db::table('coin_info')->whereTime('updata_time','today')->where('hb_id',$v['id'])->where('open_id',$open_id)->find()){
                        unset($hb_list[$k]);
                    }else{
                        if(date('Y-M-D',$dqsjc)>date('Y-M-D',$upsjc)){//已过期
                            unset($hb_list[$k]);
                        }else{//当天
                            $hb_list[$k]['is_gq'] = 1;//可领取
                            $fssj = $dqrq.' '.$v['fssj'];
                            $hb_list[$k]['day'] = 0;
                            $datediff = strtotime($fssj)-$dqsjc;
                            //计算出小时数
                            $remain = $datediff%86400;
                            $hb_list[$k]['hour'] = intval(($remain/3600));
                            // 分
                            $remain = $datediff%3600;
                            $hb_list[$k]['min'] = intval(($remain/60));
                            // 秒
                            $hb_list[$k]['sec'] = $remain%60;

                        }
                    }
                }
            }else{//重复
                $fssj = $dqrq.' '.$v['fssj'];
                if($v['fsrq']=='每天'){//每天都能领
//                    $fssj = $dqrq.' '.$v['fssj'];
                    $hb_list[$k]['day'] = 0;
                    if(Db::table('coin_info')->whereTime('updata_time','today')->where('hb_id',$v['id'])->where('open_id',$open_id)->find()){
                        $datediff = strtotime("$fssj+1 day")-$dqsjc;
                    }if((strtotime($fssj)-$dqsjc)<0){//超过今天领取时间
                        //今天已领取
                        if(Db::table('coin_info')->whereTime('updata_time','today')->where('hb_id',$v['id'])->where('open_id',$open_id)->findOrEmpty()==[]){
                            $datediff = strtotime($fssj)-$dqsjc;//剩余毫秒数
                        }else{
                            $datediff = strtotime("$fssj+1 day")-$dqsjc;//剩余毫秒数
                        }
                    }else{
                        $datediff = strtotime($fssj)-$dqsjc;
                    }
                    //计算出小时数
                    $remain = $datediff%86400;
                    $hb_list[$k]['hour'] = intval(($remain/3600));
                    // 分
                    $remain = $datediff%3600;
                    $hb_list[$k]['min'] = intval(($remain/60));
                    // 秒
                    $hb_list[$k]['sec'] = $remain%60;
                }else{
                    $c =  array_search($v['fsrq'],$weekArr)-$number_wk;
//                    echo $c;
//                    echo '<br>';
                    if($c>0){//本周内今天之后领取
                        $datediff = strtotime("$fssj+1 day")-$dqsjc;
                    }else if($c<0){//今天之后下周领取
                        $datediff = strtotime("$fssj+6 day")-$dqsjc;
                    }else{//今天领取
                        $datediff = strtotime($fssj)-$dqsjc;
                    }
//                    echo intval($datediff/86400);
                    $hb_list[$k]['day'] = intval($datediff/86400);
                    //计算出小时数
                    $remain = $datediff%86400;
                    $hb_list[$k]['hour'] = intval(($remain/3600));
                    // 分
                    $remain = $datediff%3600;
                    $hb_list[$k]['min'] = intval(($remain/60));
                    // 秒
                    $hb_list[$k]['sec'] = $remain%60;
                }
            }
//            }

        }
        foreach ($hb_list as $k => $v){
            $hb_list[$k]['count'] = Db::table('coin_info')->where('hb_id',$v['id'])->count();
            if($v['num']==Db::table('coin_info')->where('hb_id',$v['id'])->count()){
                unset($hb_list[$k]);
            }
        }
//        dump($hb_list);
//        return ;
        return json(['code'=>200,'msg'=>'红包列表','data'=>$hb_list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/business/get_sbk_jhm",
     *     tags={"运营管理"},
     *     summary="获取沙巴克激活码",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="sbk_id",type="string",description="沙巴克ID"),
     *                 example={
     *                      "sbk_id": "2",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             @OA\Examples(example="result", value={
     *                                              "jhm": "激活码",
     *                                              "sbk_id": "沙巴克id",
     *                                              "is_sy": "0未使用1已使用",
     *                                            }, summary="An result object."),
     *         )
     *     )
     * )
     */
    public function get_sbk_jhm(){
        $data = $this->request->param();
        $list = Db::table('jhm')->where('sbk_id',$data['sbk_id'])->select();
        return json(['code'=>200,'msg'=>'激活码列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/business/get_one_sbk_jhm",
     *     tags={"运营管理"},
     *     summary="获取沙巴克激活码-获取一条",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                 @OA\Property(property="open_id",type="string",description="open_id"),
     *                 example={
     *                      "sbk_id": "2",
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             @OA\Examples(example="result", value={
     *                                              "jhm": "激活码",
     *                                              "sbk_id": "沙巴克id",
     *                                              "is_sy": "0未使用1已使用",
     *                                              "open_id": "open_id",
     *                                            }, summary="An result object."),
     *         )
     *     )
     * )
     */
    public function get_one_sbk_jhm(){
        $data = $this->request->param();
        $jhmlist = Db::table('jhm')->where('is_sy',0)->where('sbk_id',$data['sbk_id'])->select();
        if(count($jhmlist) ==0){
            return json(['code'=>0,'msg'=>'激活码已用完']);
        }else{
            if(Db::table('jhm')->where('open_id',$data['open_id'])->where('sbk_id',$data['sbk_id'])->findOrEmpty()==[]){
                $list = Db::table('jhm')->where('is_sy',0)->where('sbk_id',$data['sbk_id'])->find();
                Db::table('jhm')->where('id',$list['id'])->update(['open_id'=>$data['open_id']]);
            }else{
                $list = Db::table('jhm')->where('open_id',$data['open_id'])->where('sbk_id',$data['sbk_id'])->find();
            }
            return json(['code'=>200,'msg'=>'激活码','data'=>$list]);
        }

    }

    /**
     * @OA\Post(
     *     path="/cq/business/del_sbk_jhm",
     *     tags={"运营管理"},
     *     summary="删除激活码",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                 example={
     *                      "id": "515",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *
     *     )
     * )
     */
    public function del_sbk_jhm(){
        $data = $this->request->param();
        $save = Db::table('jhm')->where('id',$data['id'])->delete();
        if($save){
            return json(['code'=>200,'msg'=>'成功']);
        }else{
            return json(['code'=>0,'msg'=>'失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/business/update_sbk_jhm",
     *     tags={"运营管理"},
     *     summary="更新使用状态",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="激活码id"),
     *                 example={
     *                      "id": "1018",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *
     *     )
     * )
     */
    public function update_sbk_jhm(){
        $data = $this->request->param();
        $info = Db::table('jhm')->where('id',$data['id'])->find();
        if($info['is_sy']==1){
            return json(['code'=>200,'msg'=>'成功']);
        }else{
            $save = Db::table('jhm')->where('id',$data['id'])->update(['is_sy'=>1]);
            if($save){
                return json(['code'=>200,'msg'=>'成功']);
            }else{
                return json(['code'=>0,'msg'=>'失败']);
            }
        }
    }

    public function te(){
        $a = '10-20';
        if(strpos($a,'-')){
            $b = explode('-',$a);
            $c = rand(intval($b[0]),intval($b[1]));
        }else{
            $c = intval($a);
        }
        dump($c);
    }

    /**
     * @OA\Post(
     *     path="/cq/business/dec_hb",
     *     tags={"运营管理"},
     *     summary="红包数量减一",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="红包id"),
     *                 example={
     *                      "id": "38",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *
     *     )
     * )
     */
    public function dec_hb($id){
        $info = Db::table('hb')->find($id);
        if($info['num']>0){
            $save = Db::table('hb')->where('id',$id)->dec('num',1)->update();
            if($save){
                return json(['code'=>200,'msg'=>'成功']);
            }else{
                return json(['code'=>0,'msg'=>'失败']);
            }
        }else{
            return json(['code'=>1,'msg'=>'已领完']);
        }

    }

    /**
     * @OA\Post(
     *     path="/cq/business/get_sbk_info",
     *     tags={"运营管理"},
     *     summary="获取沙巴克信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="id"),
     *                 example={
     *                      "id": "3",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *
     *     )
     * )
     */
    public function get_sbk_info($id){
        $list = Db::table('ul_sbk')->find($id);
        return json(['code'=>200,'msg'=>'详情','list' => $list]);
    }

    public function del_coin(){
        Db::table('coin_info')->where('fs','实物抽奖')->where('coin_num','>',0)->delete();
    }

    public function test(){
        $open_id = '1111';
        $key = $this->request->ip()."_".time()."_".$open_id;
        $check = Cache::store('file')->has($key);
//        Cache::store('file')->set($open_id, $check,1);//初始值1
//        echo 'check='.$check;
        if ($check) {
            // +1
//            Cache::store('file')->inc($key);
            $count = Cache::store('file')->get($key);
            echo $count;
            // 限制每分钟10次
            if ($count > 1) {
                return json(['code'=>500,'msg'=>"请求频率过高"]);
            }
        } else {
            Cache::store('file')->set($key, 1, 60);//初始值1
        }
    }
    public function getip(){
        foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'REMOTE_ADDR') as $key) {
        if (array_key_exists($key, $_SERVER) === true) {
            foreach (explode(',', $_SERVER[$key]) as $ip) {
                // 过滤掉可能的IP端口部分
                $ip = trim($ip); // 去除两侧空白字符
                if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false) {
                    return $ip;
                }
            }
        }
    }
    return null; // 如果没有找到有效的IP地址，则返回null
    }
    
    //测试加锁
    public function test1(){
        $data = $this->request->param();
        $lockykey = $this->lockKey.'_'.$data['id'].'test';
        $isLocked  = acquireLock($lockykey,$this->lockExpire,$data);
        if (!$isLocked) {
            // 获取锁失败，再试
            return json(['error' => 'Operation in progress, please try again later'], 503);
        }
        try {
            Db::startTrans(); // 开始数据库事务
            // 执行接口逻辑
            $info = Db::table('test')->findOrEmpty(1);
            if($info['value']<0){
//                Db::commit(); // 提交事务（实际上在这个分支中不需要，因为没有修改数据库）
                // 释放锁
//                releaseLock($lockykey);
                return json(['success' => true, 'data' => '111']);
            }else{
                $result = Db::table('test')->dec('value',1)->where('id',1)->update();
                Db::commit(); // 提交事务
                // 释放锁
//                releaseLock($lockykey);
                return json(['success' => true, 'data' => $result]);
            }
//            releaseLock($lockykey);
//            return json('1');

        } catch (\Exception $e) {
            Db::rollback(); // 回滚事务
            // 捕获异常，释放锁，并返回错误信息
//            releaseLock($lockykey);
            Log::error('Error processing request: ' . $e->getMessage());
            return json(['error' => 'An error occurred','msg'=>$e->getMessage()], 500);
        } finally {
            sleep(1);
            releaseLock($lockykey);
        }
    }
    
    public function redis_lock2()
    {
        // redis锁，避免短时间重复点击导出
        $lock_key = 'dao_chu_order_son_lock2';
        $lock_ttl = 10; // 锁的超时时间（秒）
        // 记录开始时间
        $start_time = microtime(true);

        // 创建锁对象
        $lock = new  RedisDistributedLock($lock_key, $lock_ttl);
        // 尝试获取锁,这里有阻塞吗
        $acquired = $lock->acquire();
        var_dump($acquired);

        if (!$acquired) {
            echo '导出操作正在进行中，请稍后再试！';
            die;
        }

        try {
           $info = Db::table('test')->findOrEmpty(1);
            if($info['value']<0){
//                Db::commit(); // 提交事务（实际上在这个分支中不需要，因为没有修改数据库）
                // 释放锁
//                releaseLock($lockykey);
                usleep(100000);
                return json(['success' => true, 'data' => '111']);
            }else{
                $result = Db::table('test')->dec('value',1)->where('id',1)->update();
                Db::commit(); // 提交事务
                // 释放锁
//                releaseLock($lockykey);
                usleep(100000);
                return json(['success' => true, 'data' => $result]);
            }
        } finally {
            // 记录结束时间
            $end_time = microtime(true);
            $execution_time = $end_time - $start_time;

            // 释放锁
            $deleted = $lock->release();
            var_dump($deleted); // 检查锁是否被成功删除

            // 输出执行时间
            echo "执行时间: " . $execution_time . " 秒";
        }
    }

    public function redis_lock22()
    {
        // redis锁，避免短时间重复点击导出
        $lock_key = 'dao_chu_order_son_lock2';
        $lock_ttl = 10; // 锁的超时时间（秒）
        // 记录开始时间
        $start_time = microtime(true);

        // 创建锁对象
        $lock = new  RedisDistributedLock($lock_key, $lock_ttl);
        // 尝试获取锁,这里有阻塞吗
        $acquired = $lock->acquire();
        var_dump($acquired);

        if (!$acquired) {
            echo '导出操作正在进行中，请稍后再试！';
            die;
        }

        try {
            echo "我是业务内容";
        } finally {
            // 记录结束时间
            $end_time = microtime(true);
            $execution_time = $end_time - $start_time;

            // 释放锁
            $deleted = $lock->release();
            var_dump($deleted); // 检查锁是否被成功删除

            // 输出执行时间
            echo "执行时间: " . $execution_time . " 秒";
        }
    }

}
