<?php

namespace app\cq\controller;

use app\BaseController;
use think\facade\Request;
use Carbon\Carbon;
use EasyWeChat\Factory;
use http\Cookie;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Db;
use think\facade\Queue;
use think\facade\Session;
use app\cq\common\AliSms as sendSms;

class User extends BaseController
{

    /**
     * @OA\Post(
     *     path="/cq/user/get_user_info",
     *     tags={"用户管理"},
     *     summary="获取网页端用户信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="key", type="string",description="二维码唯一key"),
     *                 example={
     *                      "key": "gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeGV4TjViT0JlaUcxMUI4dk5BY0oAAgSxBx9kAwS0AAAA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_order_user"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_user_info(){
        header('Access-Control-Allow-Origin: http://cess.5cq.com/'); // 允许所有域名访问，实际项目中应限制为特定域名
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS'); // 允许的请求方法
        header('Access-Control-Allow-Headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token,boxVersion'); // 允许的请求头字段，添加'token'
        $ip = Request::header('x-forwarded-for');
        $clientIP = explode(',', $ip)[0] ?? '';
        $key = $this->request->param('key');
        $reg  =  Db::table('reg')->where('key',$key)->findOrEmpty();
        $open_id = $reg?$reg['open_id']:null;
        if($open_id !=null){
            $up_open_id = $this->request->param('up_id');
            $token = md5($open_id.time());
            cache('user_'.$open_id, $token, 3600);
            $info = Db::table('ul_order_user')->where('open_id', $open_id)->findOrEmpty();

            if (!empty($info) && $info['state'] == 1) {
                return json(['code' => 0, 'msg' => '账户已被封禁']);
            }

            $str = $this->encryptData($open_id);
            cache('login_' . $open_id, $str, 86400);

            if (!empty($info)) {
                // 统一更新字段
                $updateData = ['ip' => $clientIP];
                if ($up_open_id != '') {
                    $updateData['up_id'] = $up_open_id; // 确保字段统一
                }

                Db::table('ul_order_user')->where('open_id', $open_id)->update($updateData);

                return json([
                    'code' => 200,
                    'msg' => '登录用户信息',
                    'data' => $info,
                    'token' => $token,
                    'loginToken' => $str
                ]);
            }else {
                $basic = basic_info();
                $data = [
                    'open_id' => $open_id,
                    'avatar' => $basic['avatar'],
                    'avatar2' => $basic['avatar'],
                    'name' => '5CQ_' . rand_zifu(3, 6),
                    'nickname' => '5CQ_' . rand_zifu(3, 6),
                    'ip' => $clientIP,
                    'up_id' => $up_open_id ?: null, // 统一使用 up_id
                ];

                try {
                    // 使用 insertGetId 避免二次查询
                    $userId = Db::table('ul_order_user')->insertGetId($data);
                    $data['id'] = $userId;

                    return json([
                        'code' => 200,
                        'msg' => '用户信息',
                        'data' => $data,
                        'token' => $token,
                        'loginToken' => $str
                    ]);
                } catch (\Exception $e) {
                    // 捕获唯一键冲突
                    if (strpos($e->getMessage(), 'Duplicate entry') !== false) {
                        // 重新获取已存在用户
                        $info = Db::table('ul_order_user')->where('open_id', $open_id)->find();
                        return json([
                            'code' => 200,
                            'msg' => '用户信息',
                            'data' => $info,
                            'token' => $token,
                            'loginToken' => $str
                        ]);
                    }
                    throw $e;
                }
            }
        }else{
            return json(['code'=>0,'msg'=>'失败']);
        }

    }
    /**
     * @OA\Post(
     *     path="/cq/user/get_user_info_h5",
     *     tags={"用户管理"},
     *     summary="获取h5用户信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_order_user"),
     *             },
     *         )
     *     )
     * )
     */

    public function get_user_info_h5(){
        $ip = Request::header('x-forwarded-for');
        $clientIP = explode(',', $ip)[0] ?? '';
        $info = Db::table('ul_order_user')->where('open_id',$this->request->param('open_id'))->find();
        if($info['state'] == 1){
                return json(['code'=>0,'msg'=>'账户已被封禁']);
            }
        $sum1 = Db::table('yxsc')->where('open_id',$this->request->param('open_id'))->sum('yxsc');//普通游戏时长
        $sum2 = Db::table('yxsc')->where('open_id',$this->request->param('open_id'))->sum('hf_sc');//好服游戏时长
        $sum = $sum1+$sum2;
        $info['yxsc'] = $sum;
        Db::table('ul_order_user')->where('open_id',$this->request->param('open_id'))->update(['ip'=>$clientIP]);
        return json(['code'=>200,'msg'=>'用户信息','data'=>$info]);
    }

    public function get_user_info_h52(){
        $ip = Request::header('x-forwarded-for');
        $clientIP = explode(',', $ip)[0] ?? '';
        $info = Db::table('ul_order_user')->where('open_id',$this->request->param('open_id'))->find();
        if($info['state'] == 1){
                return json(['code'=>0,'msg'=>'账户已被封禁']);
            }
        $sum1 = Db::table('yxsc')->where('open_id',$this->request->param('open_id'))->sum('yxsc');//普通游戏时长
        $sum2 = Db::table('yxsc')->where('open_id',$this->request->param('open_id'))->sum('hf_sc');//好服游戏时长
        $sum = $sum1+$sum2;
        $info['yxsc'] = $sum;
        Db::table('ul_order_user')->where('open_id',$this->request->param('open_id'))->update(['ip'=>$clientIP]);
        return json(['code'=>200,'msg'=>'用户信息','data'=>$info]);
    }

    /*
     *当前登录用户id
     * */
    public function get_user_id(){
        $id = Db::table('ul_order_user')->field('id')->where('open_id',Session::get('open_id'))->findOrEmpty();
        return $id;
    }

    /**
     * @OA\Post(
     *     path="/cq/user/callback_url",
     *     tags={"用户管理"},
     *     summary="微信公众号网页授权回调",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="code", type="string",description="code"),
     *                 example={
     *                      "code": "暂不支持测试",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/sq_fl"),
     *             },
     *         )
     *     )
     * )
     */
    public function callback_url(){
        $config = Config::get('wechat');
        $app = Factory::officialAccount($config);
        $oauth = $app->oauth;
        $user = $oauth->userFromCode($_GET['code']);
//        dump($user);
        $data['open_id'] = $user->getId();
        $data['nickname'] = $user->getNickname();
        $data['name'] = $user->getName();
        $data['avatar'] = $user->getAvatar();
        $list = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
        if($list){
            return json(['code'=>200,'msg'=>'用户信息','data'=>$list]);
        }else{
            Db::table('ul_order_user')->insert($data);
            $info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
            return json(['code'=>200,'msg'=>'用户信息','data'=>$info]);
        }

    }

    /*
     * 微信公众号授权登陆验证获取用户信息
     * */
    public function login_yz(){
        $config = Config::get('wechat');
        $app = Factory::officialAccount($config);
        $oauth = $app->oauth;
        $redirectUrl = $oauth->redirect('https://cqadmin.bluechs.com/cq/user/callback_url');
        header("Location: $redirectUrl");
        exit();//此处应截停
    }

    /**
     * @OA\Post(
     *     path="/cq/user/login",
     *     tags={"用户管理"},
     *     summary="微信公众号授权登录获取用户信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="code", type="string",description="code"),
     *                 example={
     *                      "code": "暂不支持测试",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/sq_fl"),
     *             },
     *         )
     *     )
     * )
     */
    public function login(){
        $data_list = Db::table('api_config')->find(1);
//        $config = Config::get('wechat');
        $config = [
            /**
             * 账号基本信息，请从微信公众平台/开放平台获取
             */
            'app_id'  => $data_list['app_id'],         // AppID
            'secret'  => $data_list['secret'],     // AppSecret
            'token'   => $data_list['token'],          // Token
            'aes_key' => $data_list['aes_key'],                    // EncodingAESKey，兼容与安全模式下请一定要填写！！！
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'redirect_url' => $data_list['redirect_url'],
            ],
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file' => __DIR__ . 'log/'.date('Ymd').'/wechat_debug.log',
            ],

            /**
             * 接口请求相关配置，超时时间等，具体可用参数请参考：
             * https://github.com/symfony/symfony/blob/5.3/src/Symfony/Contracts/HttpClient/HttpClientInterface.php
             */
            'http' => [
                'timeout' => 5.0,
                // 'base_uri' => 'https://api.weixin.qq.com/', // 如果你在国外想要覆盖默认的 url 的时候才使用，根据不同的模块配置不同的 uri

                'retry' => true, // 使用默认重试配置
                //  'retry' => [
                //      // 仅以下状态码重试
                //      'http_codes' => [429, 500]
                //       // 最大重试次数
                //      'max_retries' => 3,
                //      // 请求间隔 (毫秒)
                //      'delay' => 1000,
                //      // 如果设置，每次重试的等待时间都会增加这个系数
                //      // (例如. 首次:1000ms; 第二次: 3 * 1000ms; etc.)
                //      'multiplier' => 3
                //  ],
            ],
        ];
        $app = Factory::officialAccount($config);
        $oauth = $app->oauth;
        $code = $this->request->param('code');
        if($code=='') {
            $redirectUrl = $oauth->redirect($data_list['redirect_url']);
            return json($redirectUrl);
        }else{
            $user = $oauth->userFromCode($code);
            $data['open_id'] = $user->getId();
            $data['nickname'] = $user->getNickname();
            $data['name'] = $user->getName();
            $data['avatar'] = $user->getAvatar();
            $data['avatar2'] = $user->getAvatar();
            $token = md5($data['open_id'].time());
            cache('user_'.$data['open_id'], $token, 3600);
            $list = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
            if($list){
                return json(['code'=>200,'msg'=>'用户信息','data'=>$list,'token'=>$token]);
            }else{
                Db::table('ul_order_user')->insert($data);
                $info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                return json(['code'=>200,'msg'=>'用户信息','data'=>$info,'token'=>$token]);
            }
        }
    }


    /**
     * @OA\Post(
     *     path="/cq/user/qrcode",
     *     tags={"用户管理"},
     *     summary="生成公众号临时二维码",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/sq_fl"),
     *             },
     *         )
     *     )
     * )
     */
    public function qrcode(){
        header('Access-Control-Allow-Origin: http://cess.5cq.com'); // 允许所有域名访问，实际项目中应限制为特定域名
        header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS'); // 允许的请求方法
        header('Access-Control-Allow-Headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token, boxVersion'); // 允许的请求头字段，添加'token'
        $parm = $this->request->param();
        $data_list = Db::table('api_config')->find(1);
//        $config = Config::get('wechat');
        $config = [
            /**
             * 账号基本信息，请从微信公众平台/开放平台获取
             */
            'app_id'  => $data_list['app_id'],         // AppID
            'secret'  => $data_list['secret'],     // AppSecret
            'token'   => $data_list['token'],          // Token
            'aes_key' => $data_list['aes_key'],                    // EncodingAESKey，兼容与安全模式下请一定要填写！！！
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'redirect_url' => $data_list['redirect_url'],
            ],
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file' => __DIR__ . 'log/'.date('Ymd').'/wechat_debug.log',
            ],

            /**
             * 接口请求相关配置，超时时间等，具体可用参数请参考：
             * https://github.com/symfony/symfony/blob/5.3/src/Symfony/Contracts/HttpClient/HttpClientInterface.php
             */
            'http' => [
                'timeout' => 5.0,
                // 'base_uri' => 'https://api.weixin.qq.com/', // 如果你在国外想要覆盖默认的 url 的时候才使用，根据不同的模块配置不同的 uri

                'retry' => true, // 使用默认重试配置
                //  'retry' => [
                //      // 仅以下状态码重试
                //      'http_codes' => [429, 500]
                //       // 最大重试次数
                //      'max_retries' => 3,
                //      // 请求间隔 (毫秒)
                //      'delay' => 1000,
                //      // 如果设置，每次重试的等待时间都会增加这个系数
                //      // (例如. 首次:1000ms; 第二次: 3 * 1000ms; etc.)
                //      'multiplier' => 3
                //  ],
            ],
        ];
        $app = Factory::officialAccount($config);
        $result = $app->qrcode->temporary('foo', 180);
//        $a = $result['expire_seconds'];
        // var_dump($result);
        $urlss= "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=".urlencode($result['ticket']);
        $data['key']=$result['ticket'];
        if(array_key_exists('loginToken', $parm)){
            $open_id = $this->decryptData($parm['loginToken']);
            // return json($parm['loginToken']);
            if(Cache::get('login_' . $open_id) == $parm['loginToken']){
                // return json(1);
                $info = Db::table('ul_order_user')->where('open_id',$open_id)->findOrEmpty();
                if(empty($info)){
                    Db::table('reg')->insert($data);
                    return json(['code'=>200,'msg'=>'获取成功','data'=>$urlss,'key'=>$result['ticket']]);
                }else{
                    $token = md5($open_id.time());
                    cache('user_'.$open_id, $token, 3600);
                    return json(['code'=>200,'msg'=>'获取成功','data'=>$info,'token'=>$token]);
                }
            }else{
                // return json(2);
                Db::table('reg')->insert($data);
                return json(['code'=>200,'msg'=>'获取成功','data'=>$urlss,'key'=>$result['ticket']]);
            }
        }else{
            Db::table('reg')->insert($data);
            return json(['code'=>200,'msg'=>'获取成功','data'=>$urlss,'key'=>$result['ticket']]);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/user_report",
     *     tags={"用户管理"},
     *     summary="获取用户签到信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     *      @OA\Response(response=200,description="成功",),
     * )
     */
    public function user_report(){
        $open_id = $this->request->param('open_id');
        $month_num = Db::table('ul_user_report')
//            ->distinct("DATE_FORMAT(report_time,'%Y-%m-%d')")
            ->whereTime("report_time","month")
            ->where('open_id',$open_id)
            ->group("DATE_FORMAT(report_time,'%Y-%m-%d')")
            ->count();//当月签到天数
//        return $month_num;
        $zt = Db::table('ul_user_report')
            ->whereTime('report_time','yesterday')
            ->where('open_id',$open_id)
            ->find();//昨天签到信息
//        return json($zt);
        $jt = Db::table('ul_user_report')
            ->whereTime('report_time','today')
            ->where('open_id',$open_id)
            ->find();//今天签到信息
//        return json($jt);
        $operation_info = operation_info();//获取运营参数配置
        $jt_day = Db::table('ul_user_report')
            ->whereTime('report_time','today')
            ->where('open_id',$open_id)
            ->count();//当天签到
//        return json($jt_day);
        $zt_day =  Db::table('ul_user_report')
            ->whereTime('report_time','yesterday')
            ->where('open_id',$open_id)
            ->count();//昨天签到天数
//        return $zt_day;
//        echo $jt_day;
        //获取用户信息
        $user_info = Db::table('ul_order_user')->where('open_id',$open_id)->find();
        //获取当前等级信息
        $user_lv_info = Db::table('ul_user_level')->where('level_name',$user_info['lv'])->find();
        if($zt_day==0){
            if($jt_day==0){
                return json([
                    'code'=>0,
                    'msg'=>'昨天未签到,今天未签到',
                    'data'=>[
                        'day'=>$month_num,
                        'num'=>$operation_info['signlnCoin']*$user_lv_info['coin_scale']/100,
                    ]
                ]);
            }else{
                return json([
                    'code'=>1,
                    'msg'=>'昨天未签到,今天已签到',
                    'data'=>[
                        'day'=>$month_num,
                        'num'=>$operation_info['signlnCoin']*$user_lv_info['coin_scale']/100,
                        'jt'=>$jt['report_time']
                    ]
                ]);
            }
        }else{
            if($jt_day==0){
                return json([
                    'code'=>2,
                    'msg'=>'昨天已签到,今天未签到',
                    'data'=>[
                        'day'=>$month_num,
                        'num'=>$operation_info['signlnCoin']*$user_lv_info['coin_scale']/100,
                        'zt'=>$zt['report_time'],
                    ]
                ]);
            }else{
                return json([
                    'code'=>200,
                    'msg'=>'昨天已签到,当天已签到',
                    'data'=>[
                        'day'=>$month_num,
                        'num'=>$operation_info['signlnCoin']*$user_lv_info['coin_scale']/100,
                        'zt'=>$zt['report_time'],
                        'jt'=>$jt['report_time']
                    ]
                ]);
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/add_report",
     *     tags={"用户管理"},
     *     summary="添加签到信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     *      @OA\Response(response=200,description="成功",),
     * )
     */
    public function add_report(){
        $data['open_id'] = $this->request->param('open_id');
        $save = Db::table('ul_user_report')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'签到成功']);
        }else{
            return json(['code'=>0,'msg'=>'签到失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/jbdhye",
     *     tags={"用户管理"},
     *     summary="金币兑换余额",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "num": "200",
     *                 }
     *             )
     *         )
     *     ),
     *      @OA\Response(response=200,description="成功",),
     * )
     */
    public function jbdhye(){
        $data = $this->request->param();
        $phone = Db::table('ul_order_user')->where('open_id',$data['open_id'])->value('phone');
        if(empty($phone) || $phone == null || $phone == ''){
            return json(['code'=>1,'msg'=>'未绑定手机无法兑换']);
        }
        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();//用户信息
        $before = $user_info['money'];
        $bl = Db::table('operation')->where('id',1)->find();
        $dh_money = intval($data['num'] / $bl['coinToMoney']);
        $user_coin = floatval($user_info['coin_num'])-$dh_money*floatval($bl['coinToMoney']);
        Db::table('ul_order_user')
            ->where('open_id',$data['open_id'])
            ->inc('money',$dh_money)
            ->update();
//        return $user_coin;
        $money = floatval($user_info['money'])+floatval($dh_money);
        if($user_coin<0){
            return json(['code'=>0,'msg'=>'金币余额不足']);
        }else{
            Db::table('ul_order_user')
                ->where('open_id',$data['open_id'])
                ->dec('coin_num',floatval($dh_money)*floatval($bl['coinToMoney']))
                ->update();
        }
        $user_info = Db::table('ul_order_user')
            ->where('open_id',$data['open_id'])
            ->find();
        $later = $user_info['money'];
        $insertID = Db::table('coin_info')->insertGetId(['coin_num'=>$data['num'],'open_id'=>$data['open_id'],'fs'=>'兑换'.$dh_money.'元','title'=>'金币兑换余额','code'=>1,'real'=>$dh_money*$bl['coinToMoney']]);
         Db::table('moneyInfo')->insert(['code'=>0,'coinf_id'=>$insertID,'open_id'=>$data['open_id'],'before'=>$before,'later'=>$later,'money'=>$dh_money]);
        return json(['code'=>200,'msg'=>'恭喜您，成功兑换','data'=>$user_coin,'dh_money'=>$dh_money,'coin_num'=>$data['num'],'money'=>$money,'user_info'=>$user_info]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/updata_coin",
     *     tags={"用户管理"},
     *     summary="更新用户金币",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="code", type="int",description="code:0增1减"),
     *                 @OA\Property(property="coin_num", type="int",description="兑换数量"),
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 @OA\Property(property="hb_id", type="string",description="hb_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "code": "0",
     *                      "coin_num": "200",
     *                      "fs": "签到",
     *                      "hb_id": "",
     *                 }
     *             )
     *         )
     *     ),
     *      @OA\Response(response=200,description="成功",),
     * )
     */
     
    public function updata_coin(){
        $data = $this->request->param();
        $data['real'] = $data['coin_num'];
        if($data['code']==0){
            $coount = Db::table('coin_info')->whereTime('updata_time','today')->where('code',0)->where('open_id',$data['open_id'])->sum('coin_num');//今日获得的金币数量
//            return json($coount);
            $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();//用户信息
            $operation = operation_info();//运营参数
            $info = Db::table('ul_user_level')->where('level_name',$user_info['lv'])->find();//等级信息
//            return (intval($coount));
            if((intval($info['coin_up'])-intval($coount))>0){//未达到领取上限
//                return 1;
                if((intval($info['coin_up'])-intval($coount))>intval($data['coin_num'])){//当前金币未超出限制
                    $data['coin_num'] = floatval($data['coin_num'])*floatval($info['coin_scale'])/100;
                }else{//当前金币已超出限制
                    $data['coin_num'] = (floatval($info['coin_up'])-floatval($coount))*floatval($info['coin_scale'])/100;//按等级计算可获得金币数
                }
//                return  $data['coin_num'];
                Db::table('ul_order_user')
                    ->where('open_id',$data['open_id'])
                    ->inc('coin_num',$data['coin_num'])
                    ->update();
            }else{//达到领取上限
                $data['coin_num'] = 0;
//                return 2;
            }
            $data['difference'] = floatval($data['coin_num']) - floatval($data['real']);
            Db::table('coin_info')->insert($data);
            $up_coin = $operation['sharUserPercentage1']/100*$data['coin_num'];
            if($user_info['up_id']){
                Db::table('ul_order_user')
                    ->where('id',$user_info['up_id'])
                    ->inc('coin_num',$up_coin)
                    ->update();
                $up_user_info = Db::table('ul_order_user')->where('id',$user_info['up_id'])->find();//上级用户信息
                $up_data['open_id'] = $up_user_info['open_id'];
                $up_data['coin_num'] = $up_coin;
                $up_data['code'] = 0;
                $up_data['fs'] = '分享收益';
                Db::table('coin_info')->insert($up_data);
            }
            return json(['code'=>200,'msg'=>'成功','user_info'=>$user_info]);
        }elseif ($data['code']==1){
            Db::table('ul_order_user')
                ->where('open_id',$data['open_id'])
                ->dec('coin_num',$data['coin_num'])
                ->update();
            Db::table('coin_info')->insert($data);
            $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
            return json(['code'=>200,'msg'=>'成功','user_info'=>$user_info]);
        }
    }



    /**
     * @OA\Post(
     *     path="/cq/user/setCoin",
     *     tags={"用户管理"},
     *     summary="更新用户金币",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="type", type="int",description="1"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "type": 1,
     *                 }
     *             )
     *         )
     *     ),
     *      @OA\Response(response=200,description="成功",),
     * )
     */
     public function setCoin() {
        $param = $this->request->param();
        $data = getCoins($param);
        /*$jobId = Queue::push('app\cq\Job\AsyncJob@task1', $param);
        $iterations = 60; // 假设您希望每分钟检查60次
        $interval = 60/200; // 每次检查的间隔时间（秒）
        for ($i = 0; $i < $iterations; $i++) {
            $info = Db::table('queue_query')->where('key', $jobId)->findOrEmpty();
            if (!empty($info)) {
                Db::table('queue_query')->where('key', $jobId)->delete(); // 找到结果后立即删除记录
                return json(json_decode($info['value'], true));
            }
            sleep($interval); // 在每次查询之间等待一段时间
        }
        // 如果循环结束仍未找到结果，可以返回一个错误或默认信息
        return json(['code'=>504,'msg'=>'请求超时']);*/
        if (array_key_exists('sw', $data)) {
            return json(['code'=>200,'msg'=>'成功','order'=>1]);
        }
        if (array_key_exists('mystery', $data)) {
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs',$data['fs'])->where('updata_time','today')->findOrEmpty();
            return json(['code'=>200,'msg'=>$data['fs'].'今日已领取','mystery'=>1,'coinInfo'=>$info]);
        }
        if(array_key_exists('bylq', $data)){
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
            return json(['code'=>200,'msg'=>'白银宝箱今日已领取','coinInfo'=>$info]);
        }
        if(array_key_exists('hjlq', $data)){
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
            return json(['code'=>200,'msg'=>'黄金宝箱今日已领取','coinInfo'=>$info]);
        }
        if(array_key_exists('bjlq', $data)){
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
            return json(['code'=>200,'msg'=>'铂金宝箱今日已领取','coinInfo'=>$info]);
        }
        if(array_key_exists('zslq', $data)){
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
            return json(['code'=>200,'msg'=>'钻石宝箱今日已领取','coinInfo'=>$info]);
        }
        
        $data['real'] = $data['coin_num'];
        if($data['code']==0){
            $coount = Db::table('coin_info')->whereTime('updata_time','today')->where('code',0)->where('open_id',$data['open_id'])->sum('coin_num');//今日获得的金币数量
//            return json($coount);
            $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();//用户信息
            $operation = operation_info();//运营参数
            $info = Db::table('ul_user_level')->where('level_name',$user_info['lv'])->find();//等级信息
//            return (intval($coount));
            if((intval($info['coin_up'])-intval($coount))>0){//未达到领取上限
//                return 1;
                if((intval($info['coin_up'])-intval($coount))>intval($data['coin_num'])){//当前金币未超出限制
                    $data['coin_num'] = floatval($data['coin_num'])*floatval($info['coin_scale'])/100;
                }else{//当前金币已超出限制
                    $data['coin_num'] = (floatval($info['coin_up'])-floatval($coount))*floatval($info['coin_scale'])/100;//按等级计算可获得金币数
                }
//                return  $data['coin_num'];
                Db::table('ul_order_user')
                    ->where('open_id',$data['open_id'])
                    ->inc('coin_num',$data['coin_num'])
                    ->update();
            }else{//达到领取上限
                $data['coin_num'] = 0;
//                return 2;
            }
            $data['difference'] = floatval($data['coin_num']) - floatval($data['real']);
            $insertID = Db::table('coin_info')->insertGetId($data);
            $coininfo = Db::table('coin_info')->find($insertID);
            $up_coin = $operation['sharUserPercentage1']/100*$data['coin_num'];
            if(!empty($user_info['up_id'])){
                Db::table('ul_order_user')
                    ->where('id',$user_info['up_id'])
                    ->inc('coin_num',$up_coin)
                    ->update();
                $up_user_info = Db::table('ul_order_user')->where('id',$user_info['up_id'])->findOrEmpty();//上级用户信息
                if(!empty($up_user_info)){
                    $up_data['open_id'] = $up_user_info['open_id'];
                    $up_data['coin_num'] = $up_coin;
                    $up_data['code'] = 0;
                    $up_data['fs'] = '分享收益';
                    Db::table('coin_info')->insert($up_data);
                }
                
            }
            return json(['code'=>200,'msg'=>'成功','user_info'=>$user_info,'coinInfo'=>$coininfo]);
        }elseif ($data['code']==1){
            Db::table('ul_order_user')
                ->where('open_id',$data['open_id'])
                ->dec('coin_num',$data['coin_num'])
                ->update();
            $insertID = Db::table('coin_info')->insertGetId($data);
            $coininfo = Db::table('coin_info')->find($insertID);
            $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
            return json(['code'=>200,'msg'=>'成功','user_info'=>$user_info,'coinInfo'=>$coininfo]);
        }
    }

    public function getCoin($data){
        $basic_info = Db::table('basic')->find(1);//基础参数配置
        $operation_info = Db::table('operation')->find(1);
        $luckyCoin = Db::table('luckyCoin')->find(1);//金币转盘配置
        $luckyPrize = Db::table('luckyPrize')->find(1);//实物转盘配置
//        $data = $this->request->param();//请求参数
        switch ($data['type']){
            case 1:    //签到
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','签到')->whereTime('updata_time','today')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['signlnCoin'];
                $data['fs'] = '签到';
                $data['code'] = 0;
                $data['title'] = '签到';
                break;
            case 2:    //签到3天奖励
                // 获取当前月份的第一天和最后一天
                $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
                $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到3天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
                ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['signlnCoin3'];
                $data['fs'] = '累计签到3天奖励';
                $data['code'] = 0;
                $data['title'] = '累计签到3天奖励';
                break;
            case 3:    //签到7天奖励
                $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
                $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到7天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
                ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['signlnCoin7'];
                $data['fs'] = '累计签到7天奖励';
                $data['code'] = 0;
                $data['title'] = '累计签到7天奖励';
                break;
            case 4:    //签到14天奖励
                $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
                $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到14天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
                ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['signlnCoin14'];
                $data['fs'] = '累计签到14天奖励';
                $data['code'] = 0;
                $data['title'] = '累计签到14天奖励';
                break;
            case 5:    //签到28天奖励
                $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
                $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到28天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
                ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['signlnCoin28'];
                $data['fs'] = '累计签到28天奖励';
                $data['code'] = 0;
                $data['title'] = '累计签到28天奖励';
                break;
            case 6:    //绑定手机
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','绑定手机')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['mainCoin'];
                $data['fs'] = '绑定手机';
                $data['code'] = 0;
                $data['title'] = '绑定手机';
                break;
            case 7:    //实名认证
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','实名认证')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['mainCoin'];
                $data['fs'] = '实名认证';
                $data['code'] = 0;
                $data['title'] = '实名认证';
                break;
            case 8:    //注册立得金币
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','注册')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['registerCoin'];
                $data['fs'] = '注册';
                $data['code'] = 0;
                $data['title'] = '注册';
                break;
            case 9:    //发帖回帖评论得金币
                $data['coin_num'] = $operation_info['postCoin'];
                $data['fs'] = '发帖回帖评论';
                $data['code'] = 0;
                $data['title'] = '发帖回帖评论';
                break;
            case 10:    //浏览游戏得金币
                $data['coin_num'] = $operation_info['lookGame'];
                $data['fs'] = '浏览游戏';
                $data['code'] = 0;
                $data['title'] = '浏览游戏';
                break;
            case 11:    //白银宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin30']);
                    $data['coin_num'] = rand($coin[0],$coin[1]);
                    $data['fs'] = '白银宝箱';
                    $data['code'] = 0;
                    $data['title'] = '白银宝箱';
                }else{
                    $data['bylq'] = 1;
                }
                break;
            case 12:    //黄金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin60']);
                    $data['coin_num'] = rand($coin[0],$coin[1]);
                    $data['fs'] = '黄金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '黄金宝箱';
                }else{
                    $data['hjlq'] = 1;
                }
                break;
            case 13:    //铂金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin120']);
                    $data['coin_num'] = rand($coin[0],$coin[1]);
                    $data['fs'] = '铂金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '铂金宝箱';
                }else{
                    $data['bjlq'] = 1;
                }
                break;
            case 14:    //钻石宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin240']);
                    $data['coin_num'] = rand($coin[0],$coin[1]);
                    $data['fs'] = '钻石宝箱';
                    $data['code'] = 0;
                    $data['title'] = '钻石宝箱';
                }else{
                    $data['zslq'] = 1;
                }
                break;
            case 15:    //金币转盘消耗
                $data['coin_num'] = $operation_info['luckCoinConsume'];
                $data['fs'] = '金币抽奖';
                $data['code'] = 1;
                $data['title'] = '金币抽奖';
                break;
            case 16:    //实物转盘消耗
                $data['coin_num'] = $operation_info['luckPrizeCoinConsume'];
                $data['fs'] = '实物抽奖';
                $data['code'] = 1;
                $data['title'] = '实物抽奖';
                break;
            case 17:    //金币转盘奖品
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber'.$data['state']])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle'.$data['state']];
                unset($data['state']);
                break;
            /*case 17:    //金币奖品1
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber1'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle1'];
                break;
            case 18:    //金币奖品2
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber2'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle2'];
                break;
            case 19:    //金币奖品3
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber3'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle3'];
                break;
            case 20:    //金币奖品4
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber4'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle4'];
                break;
            case 21:    //金币奖品5
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber5'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle5'];
                break;
            case 22:    //金币奖品6
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber6'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle6'];
                break;
            case 23:    //金币奖品7
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber7'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle7'];
                break;
            case 24:    //金币奖品8
                $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber8'])*floatval($operation_info['luckCoinConsume']);
                $data['fs'] = '金币抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyCoinItemTitle8'];
                break;*/
            case 25:    //实物转盘奖品
                $concatenatedString = $luckyPrize['luckyPrizeItemTitle'. $data['state']] ;
                //判断$luckyPrize['luckyPrizeItemTitle'].$data['state']的值是否包含金币两个字
                // 使用 strpos() 检查是否包含“金币”
                if (strpos($concatenatedString, '金币') !== false) {
                    // 包含“金币”
                    $coin = explode('金币',$concatenatedString);
                    $data['coin_num'] = $coin[0];
                    // 在此处执行相关逻辑
                } else {
                    // 不包含“金币”
                    $data['sw'] = 0;
                    // 在此处执行其他逻辑
                }
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $concatenatedString;
                unset($data['state']);
                break;
            /*case 25:    //实物奖品1
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle1']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle1'];
                break;
            case 26:    //实物奖品2
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle2']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle2'];
                break;
            case 27:    //实物奖品3
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle3']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle3'];
                break;
            case 28:    //实物奖品4
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle4']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle4'];
                break;
            case 29:    //实物奖品5
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle5']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle5'];
                break;
            case 30:    //实物奖品6
                $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle6']);
                $data['coin_num'] = $coin[0];
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle6'];
                break;
            case 31:    //实物奖品7
                $data['coin_num'] = 0;
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle7'];
                break;
            case 32:    //实物奖品8
                $data['coin_num'] = 0;
                $data['fs'] = '实物抽奖';
                $data['code'] = 0;
                $data['title'] = $luckyCoin['luckyPrizeItemTitle8'];
                break;*/
            case 33:    //领取红包
                $hbinfo = Db::table('hb')->where('id',$data['hb_id'])->findOrEmpty();
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','红包奖励')->where('updata_time','today')->where('hb_id',$data['hb_id'])->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                if(!empty($hbinfo) && strpos($hbinfo['price'],'-') != false){
                    $coin = explode('-',$hbinfo['price']);
                    $data['coin_num'] = rand($coin[0],$coin[1]);
                }elseif (!empty($hbinfo) && strpos($hbinfo['price'],'-') == false){
                    $data['coin_num'] = $hbinfo['price'];
                }else{
                    $data['coin_num'] = 0;
                }
                $data['fs'] = '红包奖励';
                $data['code'] = 0;
                $data['title'] = '红包奖励';
                break;
            case 34:    //每日盲盒
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','每日盲盒')->where('updata_time','today')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $coin = explode('-',$operation_info['luck']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
                $data['fs'] = '每日盲盒';
                $data['code'] = 0;
                $data['title'] = '每日盲盒';
                break;
            case 35:    //特色好服任务一  额外参数：yx_id
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏在线时长60分钟')->where('updata_time','today')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['renwu1'];
                $data['fs'] = '游戏在线时长60分钟';
                $data['code'] = 0;
                $data['title'] = '任务一';
                break;
            case 36:    //特色好服任务二  额外参数：yx_id
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏在线时长120分钟')->where('updata_time','today')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['renwu2'];
                $data['fs'] = '游戏在线时长120分钟';
                $data['code'] = 0;
                $data['title'] = '任务二';
                break;
            case 37:    //特色好服任务三  额外参数：yx_id
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏评分')->where('updata_time','today')->findOrEmpty();
                if(!empty($info)){
                    $data['mystery'] = 0;
                }
                $data['coin_num'] = $operation_info['renwu3'];
                $data['fs'] = '游戏评分';
                $data['code'] = 0;
                $data['title'] = '任务三';
                break;
            case 38:    //金币商城兑换物品  额外参数：goods_id
                $info = Db::table('ul_coin_goods')->where('id',$data['goods_id'])->findOrEmpty();
                $data['coin_num'] = $info['price'];
                $data['fs'] = '物品兑换';
                $data['code'] = 1;
                $data['title'] = $info['title'];
                break;
            case 39:    //活动赛事竞猜红方投注  额外参数：coin_num  sbk_id
                $data['fs'] = '比赛竞猜';
                $data['code'] = 1;
                $data['tz_type'] = 1;
                $data['title'] = '红方投注';
                break;
            case 40:    //活动赛事竞猜蓝方投注  额外参数：coin_num  sbk_id
                $data['fs'] = '比赛竞猜';
                $data['code'] = 1;
                $data['tz_type'] = 2;
                $data['title'] = '蓝方投注';
                break;
            case 41:    //活动赛事竞猜结算  额外参数：  sbk_id
                $sbkinfo = Db::table("ul_sbk")->where('id',$data['sbk_id'])->findOrEmpty();
                $tzcoin = Db::table("coin_info")->where('sbk_id',$data['sbk_id'])->where('tz_type',$sbkinfo['sy_type'])->sum('coin_num');
                $data['coin_num'] = $tzcoin /floatval($sbkinfo['matic_price'])* $tzcoin;
                $data['fs'] = '比赛竞猜';
                $data['code'] = 0;
                $data['tz_type'] = 2;
                $data['title'] = '竞猜奖励';
                break;
            case 42:    //白银宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin30']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页白银宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页白银宝箱';
                }else{
                    $data['bylq'] = 1;
                }
                break;
            case 43:    //黄金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin60']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页黄金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页黄金宝箱';
                }else{
                    $data['hjlq'] = 1;
                }
                break;
            case 44:    //铂金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin120']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页铂金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页铂金宝箱';
                }else{
                    $data['bjlq'] = 1;
                }
                break;
            case 45:    //钻石宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin240']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页钻石宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页钻石宝箱';
                }else{
                    $data['zslq'] = 1;
                }
                break;
            case 46://网页分享得金币，每次10个金币，每天最多十次
                $list = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','网页分享得金币')->whereTime('updata_time','today')->select();
                if(count($list) < 10){
                    $data['coin_num'] = 10;
                    $data['fs'] = '网页分享得金币';
                    $data['code'] = 0;
                    $data['title'] = '网页分享得金币';
                }else{
                    $data['coin_num'] = 0;
                    $data['fs'] = '网页分享得金币';
                    $data['code'] = 0;
                    $data['title'] = '网页分享得金币';
                    $data['share'] = 1;
                }
                break;
        }

        return $data;
    }

    public function setCoinShare(){
        $data = $this->request->param();
        $userinfo = Db::table('ul_order_user')->where('id',$data['id'])->findOrEmpty();
        if(empty($userinfo)){
            return json(['code'=>0,'msg'=>'用户不存在']);
        }
        $list = Db::table('coin_info')->where('open_id',$userinfo['open_id'])->where('fs','网页分享得金币')->whereTime('updata_time','today')->select();
        if(count($list) < 10){
            $coinNum = 10;

            $addData = [];
            $addData['open_id'] = $userinfo['open_id'];
            $addData['coin_num'] = $coinNum;
            $addData['real'] = $coinNum;
            $addData['difference'] = 0;
            $addData['code'] = 0;
            $addData['fs'] = '网页分享得金币';
            $addData['title'] = '网页分享得金币';

            Db::table('ul_order_user')
                ->where('id', $data['id'])
                ->inc('coin_num', $coinNum)
                ->update();

            $insertID = Db::table('coin_info')->insertGetId($addData);
            $coininfo = Db::table('coin_info')->find($insertID);
            $user_info = Db::table('ul_order_user')->where('id', $data['id'])->find();

            return json([
                'code' => 200,
                'msg' => '成功',
                'user_info' => $user_info,
                'coinInfo' => $coininfo
            ]);
        }else{
            return json(['code'=> 0,'msg'=> '今日网页分享得金币次数已达上限']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/add_sp",
     *     tags={"用户管理"},
     *     summary="发布视频",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="title", type="string",description="视频标题"),
     *                 @OA\Property(property="tjwz", type="int",description="推荐网址"),
     *                 @OA\Property(property="file_id", type="int",description="文件ID"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "title": "测试",
     *                      "tjwz": "www.baidu.com",
     *                      "file_id": "128",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/fbsp"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_sp(){
        $data = $this->request->param();
        $save = Db::table('fbsp')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'发布成功']);
        }else{
            return json(['code'=>0,'msg'=>'发布失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/all_sp",
     *     tags={"用户管理"},
     *     summary="获取所有视频",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/fbsp"),
     *             },
     *         )
     *     )
     * )
     */
    public function all_sp(){
        $list = Db::table('fbsp')->where('is_sh',1)->order('add_time desc')->select()->toArray();
        foreach ($list as $k => $v){
            $list[$k]['id'] = $v['id'];
            $video_info = Db::table('ul_system_uploadfile')->where('id',$v['file_id'])->find();
            $list[$k]['videoUrl'] = $video_info['url'];
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/coin_info",
     *     tags={"用户管理"},
     *     summary="查询用户当月单条金币记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fs", type="string",description="获取方式"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "fs": "累计签到3天奖励",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function coin_info(){
        $data = $this->request->param();
        $list = Db::table('coin_info')
            ->whereTime('updata_time','month')
            ->where('fs',$data['fs'])
            ->where('open_id',$data['open_id'])
            ->find();
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    public function coin_info_today(){
        $data = $this->request->param();
        $list = Db::table('coin_info')
            ->whereDay('updata_time')
            ->where('fs',$data['fs'])
            ->where('open_id',$data['open_id'])
            ->find();
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/coin_info_list",
     *     tags={"用户管理"},
     *     summary="查询用户所有金币记录-分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="pageNum", type="int",description="pageNum"),
     *                 @OA\Property(property="pageSize", type="int",description="pageSize"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "pageNum": "1",
     *                      "pageSize": "10",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function coin_info_list(){
        $data = $this->request->param();
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $limit = Db::table('coin_info')
            ->where('open_id',$data['open_id'])
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('coin_info')
            ->page($page, $count)
            ->where('open_id',$data['open_id'])
            ->order('updata_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/user_coin_info_list",
     *     tags={"用户管理"},
     *     summary="获取当前用户指定金币记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 @OA\Property(property="pageNum", type="int",description="pageNum"),
     *                 @OA\Property(property="pageSize", type="int",description="pageSize"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "fs": "签到",
     *                      "pageNum": "1",
     *                      "pageSize": "10",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function user_coin_info_list(){
        $data = $this->request->param();
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $limit = Db::table('coin_info')
            ->where('open_id',$data['open_id'])
            ->where('fs',$data['fs'])
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('coin_info')
            ->page($page, $count)
            ->where('open_id',$data['open_id'])
            ->where('fs',$data['fs'])
            ->order('updata_time desc')
            ->select()->toArray();
        if($data['fs']=='比赛竞猜'){
            $sbk_list = Db::table('ul_sbk')->order('add_time asc')->select()->toArray();
            foreach ($sbk_list as $k =>$v){
                $sbk_list[$k]['qs'] = '第'.($k+1).'期';
            }
            rsort($sbk_list);
            foreach ($list as $k =>$v){
                foreach ($sbk_list as $k1 => $v1){
                    if($v['sbk_id']==$v1['id']){
                        $list[$k]['qs'] = $v1['qs'];
                    }else{
                        $list[$k]['qs'] = '第1期';
                    }
                }
            }
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/no_user_coin_info_list",
     *     tags={"用户管理"},
     *     summary="获取当前用户指定金币记录-不分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 example={
     *                      "open_id": "ociWS6ki2ki7j5sv44DWiwhva9H4",
     *                      "fs": "红包奖励",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function no_user_coin_info_list(){
        $data = $this->request->param();
        if(array_key_exists('sbk_id',$data)){
            $list = Db::table('coin_info')
                ->where('open_id',$data['open_id'])
            ->where('sbk_id',$data['sbk_id'])
                ->where('fs',$data['fs'])
                ->order('updata_time desc')
                ->select();
        }else{
            $list = Db::table('coin_info')
                ->where('open_id',$data['open_id'])
                ->where('fs',$data['fs'])
                ->order('updata_time desc')
                ->select();
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/user_coin_info_list_no",
     *     tags={"用户管理"},
     *     summary="获取当前用户指定金币记录-只有增加的记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 @OA\Property(property="pageNum", type="int",description="pageNum"),
     *                 @OA\Property(property="pageSize", type="int",description="pageSize"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "fs": "签到",
     *                      "pageNum": "1",
     *                      "pageSize": "10",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function user_coin_info_list_no(){
        $data = $this->request->param();
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $limit = Db::table('coin_info')
            ->where('open_id',$data['open_id'])
            ->where('code',0)
            ->where('fs',$data['fs'])
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('coin_info')
            ->page($page, $count)
            ->where('code',0)
            ->where('open_id',$data['open_id'])
            ->where('fs',$data['fs'])
            ->order('updata_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list,'limit'=>$limits,'count'=>$limit]);
    }


    /**
     * @OA\Post(
     *     path="/cq/user/all_coin_info_list",
     *     tags={"用户管理"},
     *     summary="获取所有用户指定金币记录-分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 @OA\Property(property="pageNum", type="int",description="pageNum"),
     *                 @OA\Property(property="pageSize", type="int",description="pageSize"),
     *                 example={
     *                      "fs": "签到",
     *                      "pageNum": "1",
     *                      "pageSize": "10",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function all_coin_info_list(){
        $data = $this->request->param();
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $limit = Db::table('coin_info')
            ->where('fs',$data['fs'])
            ->where('code',0)
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('coin_info')
            ->page($page, $count)
            ->where('fs',$data['fs'])
            ->where('code',0)
            ->order('updata_time desc')
            ->select()->toArray();
        foreach ($list as $k => $v){
            $user_info  = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
          $list[$k]['nickname'] = isset($user_info['nickname'])&&!empty($user_info['nickname'])?$user_info['nickname']:'微信用户';
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/all_coin_info_list_no",
     *     tags={"用户管理"},
     *     summary="获取所有用户指定金币记录-不分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 example={
     *                      "fs": "金币抽奖",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function all_coin_info_list_no(){
        $data = $this->request->param();
        $list = Db::table('coin_info')
            ->where('fs',$data['fs'])
            ->where('code',0)
            ->order('updata_time desc')
            ->select()->toArray();
        foreach ($list as $k => $v){
            $user_info  = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
            $list[$k]['nickname'] = $user_info['nickname'];
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/update_user_info",
     *     tags={"用户管理"},
     *     summary="更新用户信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_order_user"),
     *             },
     *         )
     *     )
     * )
     */
    public function update_user_info(){
        $data = $this->request->param();
        if(isset($data['sfz']) && !empty($data['sfz'])){
            $sfzcount = Db::table('ul_order_user')->where('sfz',$data['sfz'])->count();
            if($sfzcount != 0){
                return json(['code'=>0,'msg'=>'身份证已经注册']);
            }else{
                if($this->isAdultByIdCard($data['sfz'])){
                    $info = $this->sfzyz($data['sfz'],$data['realname']);
//                var_dump($info);
//                 return $info;
                    if($info['respCode']!=="0000"){
                        return json(['code' => $info['respCode'], 'msg' => $info['respMessage']]);
                    }
                }else{
                    return json(['code' => 0, 'msg' => '身份证未满18岁']);
                }
            }
        }
        if(isset($data['phone']) && !empty($data['phone'])){
            $phonecount = Db::table('ul_order_user')->where('phone',$data['phone'])->count();
            if($phonecount != 0){
                return json(['code'=>0,'msg'=>'手机号已经注册']);
            }
        }
        $data['is_sh'] = 0;
        $save = Db::table('ul_order_user')->where('open_id',$data['open_id'])->update($data);
        if($save){
            return json(['code'=>200,'msg'=>'更新成功','data'=>Db::table('ul_order_user')->where('open_id',$data['open_id'])->find()]);
        }else{
            return json(['code'=>0,'msg'=>'更新失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/add_tz",
     *     tags={"用户管理"},
     *     summary="发布帖子",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fl_id", type="int",description="fl_id"),
     *                 @OA\Property(property="title", type="string",description="title"),
     *                 @OA\Property(property="info", type="string",description="info"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "fl_id": "1",
     *                      "title": "test",
     *                      "info": "test",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/fbtz"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_tz(){
        $data = $this->request->param();
        $data['info'] = htmlspecialchars_decode($data['info']);
        $save = Db::table('fbtz')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'发表成功']);
        }else{
            return json(['code'=>0,'msg'=>'发布失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/tz_info",
     *     tags={"用户管理"},
     *     summary="发布帖子",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id", type="int",description="id"),
     *                 example={
     *                      "id": "1",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/fbtz"),
     *             },
     *         )
     *     )
     * )
     */
    public function tz_info($id){
        $info = Db::table('fbtz')->find($id);
        $info['user_info'] = Db::table('ul_order_user')->where('open_id',$info['open_id'])->find();
        return json(['code'=>200,'msg'=>'获取成功','data'=>$info]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/pllist",
     *     tags={"用户管理"},
     *     summary="评论列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/tz_pl"),
     *             },
     *         )
     *     )
     * )
     */
    public function pllist($id){
        $list = Db::table('tz_pl')->where('is_sh',1)->where('tz_id',$id)->select()->toArray();
        foreach ($list as $k => $v){
            $list[$k]['user_info'] = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
        }
        return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/addpl",
     *     tags={"用户管理"},
     *     summary="发表评论",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="int",description="open_id"),
     *                 @OA\Property(property="tz_id", type="int",description="tz_id"),
     *                 @OA\Property(property="pl_info", type="string",description="pl_info"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "tz_id": "1",
     *                      "pl_info": "test",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/tz_pl"),
     *             },
     *         )
     *     )
     * )
     */
    public function addpl(){
        $data = $this->request->param();
        $save = Db::table('tz_pl')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'发表成功']);
        }else{
            return json(['code'=>0,'msg'=>'发布失败']);
        }
    }


    /**
     * @OA\Post(
     *     path="/cq/user/send_code",
     *     tags={"用户管理"},
     *     summary="发送验证码-阿里云",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="phone", type="int",description="phone"),
     *                 example={
     *                      "phone": "13800000000",
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
    public function send_code($phone){
        $phone = $this->request->param('phone');
        $select = Db::table('ul_order_user')->where('phone',$phone)->count();
        if($select !=0){
            return json(['code'=>1,'msg'=>'同一个手机号只能绑定一个账号']);
        }else{
            $code = mt_rand(100000,999999);
            $data = [
                'phone'=>$phone,
                'code'=>$code
            ];
            //判断运营商
            //调用阿里云短信发送方法
            $send = new sendSms();
            $result = $send::main($data);
            $result['data']= [
                'yzm'=>$code,
                'phone'=>$phone
            ];
            return json($result);
        }

    }

    /**
     * @OA\Post(
     *     path="/cq/user/send_code_dxb",
     *     tags={"用户管理"},
     *     summary="发送验证码-短信宝",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="phone", type="int",description="phone"),
     *                 example={
     *                      "phone": "13800000000",
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
    public function send_code_dxb(){
        $data_list = Db::table('api_config')->find(1);
        $phone = $this->request->param('phone');
        $select = Db::table('ul_order_user')->where('phone',$phone)->count();
        if($select > 0){
            return json(['code'=>1,'msg'=>'同一个手机号只能绑定一个账号']);
        }else{
            $code = mt_rand(100000,999999);
            $statusStr = array(
                "0" => "短信发送成功",
                "-1" => "参数不全",
                "-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
                "30" => "密码错误",
                "40" => "账号不存在",
                "41" => "余额不足",
                "42" => "帐户已过期",
                "43" => "IP地址限制",
                "50" => "内容含有敏感词"
            );
            $smsapi = "http://api.smsbao.com/";
            $user = $data_list['sms_user']; //短信平台帐号
            $pass = md5($data_list['sms_pwd']); //短信平台密码
            $content="【传奇盒子】您的验证码是".strval($code)."，如非本人操作，请忽略本短信。";//要发送的短信内容
            $phone = $phone;//要发送短信的手机号码
            $sendurl = $smsapi."sms?u=".$user."&p=".$pass."&m=".$phone."&c=".urlencode($content);
            $result =file_get_contents($sendurl) ;
//        echo $statusStr[$result];
            if($result=='0'){
                return json(['code'=>0,'data'=>['yzm'=>$code,'phone'=>$phone]]);
            }else{
                return json(['code'=>$result,'msg'=>$result[$statusStr]]);
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/yxcz",
     *     tags={"用户管理"},
     *     summary="余额充值到游戏",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="int",description="open_id"),
     *                 @OA\Property(property="yxmc", type="string",description="yxmc"),
     *                 @OA\Property(property="yxgw", type="string",description="yxgw"),
     *                 @OA\Property(property="czje", type="string",description="czje"),
     *                 @OA\Property(property="hbmc", type="string",description="hbmc"),
     *                 @OA\Property(property="czzh", type="string",description="czzh"),
     *                 @OA\Property(property="czqf", type="string",description="czqf"),
     *                 @OA\Property(property="QQ", type="string",description="QQ"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "yxmc": "test",
     *                      "yxgw": "test",
     *                      "czje": 1,
     *                      "hbmc": "test",
     *                      "czzh": "test",
     *                      "czqf": "test",
     *                      "QQ": "test",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxcz"),
     *             },
     *         )
     *     )
     * )
     */
    public function yxcz(){
        $data = $this->request->param();
        $money = $data['czje'];
        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
        $before = $user_info['money'];
        if($user_info['money']>=$data['czje']){
            $save = Db::table('yxcz')->insertGetId($data);
            if($save){
                Db::table('ul_order_user')->where('open_id',$data['open_id'])->dec('money',$data['czje'])->update();
                $data = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                $later = $data['money'];
                Db::table('moneyInfo')->insert(['code'=>1,'coinf_id'=>$save,'open_id'=>$data['open_id'],'before'=>$before,'later'=>$later,'money'=>$money]);
                return json(['code'=>200,'msg'=>'充值成功','data'=>$data]);
            }else{
                return json(['code'=>0,'msg'=>'充值失败']);
            }
        }else{
            return json(['code'=>1,'msg'=>'余额不足']);
        }
    }

    /*
     * 测试
     * */
    public function test(){
        $data = $this->request->param();
        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
        if($user_info>=$data['czje']){
            return 1;
        }else{
            return 2;
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/jbhdbd",
     *     tags={"用户管理"},
     *     summary="金币获得榜单",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",

     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function jbhdbd(){
        $list = Db::table('coin_info')
            ->field('open_id,SUM(coin_num) as count')
            ->where('code',0)
            ->group('open_id')
            ->order('count desc')
            ->select()->toArray();
        foreach ($list as $k =>$v){
            $list[$k]['sort'] = $k+1;
            $user_info = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
            $list[$k]['user_name'] = isset($user_info['nickname'])&&!empty($user_info['nickname'])?$user_info['nickname']:'微信用户';
        }
        return json(['code'=>200,'msg'=>'成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/dr_ft_sl",
     *     tags={"用户管理"},
     *     summary="获取用户当日发发帖回帖数量",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="int",description="open_id"),
     *                 @OA\Property(property="QQ", type="string",description="QQ"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             @OA\Examples(example="result", value={
     *                                              "ft_num": "今日发帖数量",
     *                                              "pl_num": "今日评论数量",
     *                                            }, summary="An result object."),
     *         )
     *     )
     * )
     */
    public function dr_ft_sl(){
        $data = $this->request->param();
        //今日发帖数量
        $list['ft_num'] = Db::table('fbtz')->where('open_id',$data['open_id'])->whereTime('fb_time','today')->count();
        //今日评论数量
        $list['pl_num'] = Db::table('tz_pl')->where('open_id',$data['open_id'])->whereTime('time','today')->count();
        return json(['code'=>200,'msg'=>'成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_yqsy",
     *     tags={"用户管理"},
     *     summary="获取邀请人数和收益",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="int",description="open_id"),
     *                 @OA\Property(property="QQ", type="string",description="QQ"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/coin_info"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_yqsy(){
        $data = $this->request->param();
        //获取用户信息
        $userinfo = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
        //zjyqrs
        $zjyqrs_list = Db::table('ul_order_user')->where('up_id',$userinfo['id'])->select()->toArray();
        $list['zjyqrs'] = count($zjyqrs_list);//直接邀请人数
        //直接邀请收益
        $zjfxsy_list = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','分享收益')->select()->toArray();
        $list['zjyqsy'] = array_sum(array_column($zjfxsy_list,'coin_num'));//直接邀请收益
        //间接邀请人数和收益
        foreach ($zjyqrs_list as $k =>$v){
            $zjyqrs_list[$k]['count'] = Db::table('ul_order_user')->where('up_id',$v['id'])->count();
            $zjyqrs_list[$k]['jjyqsy'] = Db::table('coin_info')->field('sum(coin_num) as count')
                ->where('fs','分享收益')->where('open_id',$v['open_id'])->select()->toArray();
            $zjyqrs_list[$k]['jjsy'] = array_sum(array_column($zjyqrs_list[$k]['jjyqsy'],'count'));
        }
//        dump($zjyqrs_list);
        $list['jjyqrs'] = array_sum(array_column($zjyqrs_list,'count'));//间接邀请人数
        $list['jjyqsy'] = array_sum(array_column($zjyqrs_list,'jjsy'));//间接分享收益
        //简介邀请收益
        return json(['code'=>200,'msg'=>'成功','data'=>$list]);
    }

    /*
     * 获取中奖数字
     * */
    public function aaaaa(){
        $c = [0,1,2,8,4,3,7,6,5];
        $b = rand(0,1000);
        $list = Db::table('luckyCoin')->where('id',1)->find();
        for ($i =1;$i<9;$i++){
            $a = $list['luckyCoinItemProb'.$i];
            if($a>$b){
                if($i<5){
                    return json(['code'=>200,'msg'=>'成功','data'=>array_search($i-1,$c)]);
                }else{
                    return json(['code'=>200,'msg'=>'成功','data'=>array_search($i,$c)]);
                }
            }
        }
    }

    public function bbbbbb(){
        $c = [0,1,2,8,4,3,7,6,5];
        $b = rand(0,1000);
        $list = Db::table('luckyPrize')->where('id',1)->find();
        for ($i =1;$i<9;$i++){
            $a = $list['luckyPrizeItemProb'.$i];
            if($a>$b){
//                echo $a;
                if($i<5){
                    return json(['code'=>200,'msg'=>'成功','data'=>array_search($i-1,$c)]);
                }else{
                    return json(['code'=>200,'msg'=>'成功','data'=>array_search($i,$c)]);
                }
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_dthb",
     *     tags={"用户管理"},
     *     summary="获取当天当前可以领取的红包",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *         )
     *     ),
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
    public function get_dthb(){
        $number_wk = date("w");
        $weekArr = array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
        $xq = Db::table("hb")
            ->where('fsrq',$weekArr[$number_wk])
            ->where('fssj',">=",date('H:i:s',strtotime('-10 min',time())))
            ->select()->toArray();//查询星期重复红包
        $dtlj = Db::table("hb")
            ->whereTime('updata_time','-10 min')
            ->where('type',0)
            ->where('statu',0)
//            ->fetchSql()
            ->select()->toArray();//查询单天立即发送红包
        $dtgd = Db::table("hb")
            ->whereTime('updata_time','today')
            ->where('fssj',">=",date('H:i:s',strtotime('-10 min',time())))
            ->where('type',0)
            ->where('statu',1)
//            ->fetchSql()
            ->select()->toArray();//查询单天固定时间发送红包
        $mt = Db::table("hb")
            ->where('fsrq','每天')
            ->where('fssj',">=",date('H:i:s',strtotime('-10 min',time())))
            ->select()->toArray();//查询每天重复红包

        $list = array_merge($xq,$dtlj,$dtgd,$mt);
        $sort = array_column($list,'fssj');
        array_multisort($sort,SORT_ASC,$list);
        return json(['code'=>200,'msg'=>'成功','data'=>$list]);
    }

    /*
         * 查询当前红包是否领取
         * */
    public function hblqqk(){
        $data = $this->request->param();
        $info = Db::table("coin_info")
            ->whereTime('updata_time','today')
            ->where('open_id',$data['open_id'])
            ->where('hb_id',$data['hb_id'])
            ->find();
        if ($info) {
            return json(['code' => 200, 'msg' => '已领取']);
        } else {
            return json(['code' => 0, 'msg' => '未领取']);
        }
    }

    public function sfzyz($idNo,$name){
        $host = "https://idenauthen.market.alicloudapi.com";
        $path = "/idenAuthentication";
        $method = "POST";
        $appcode = "4779a629ddae4ea5ad58ea245a8722f7";
        $headers = array();
        array_push($headers, "Authorization:APPCODE " . $appcode);
        //根据API的要求，定义相对应的Content-Type
        array_push($headers, "Content-Type".":"."application/x-www-form-urlencoded; charset=UTF-8");
        $querys = "";
        $data['idNo'] = $idNo;
        $data['name'] = $name;
        $bodys = http_build_query($data);
        // $bodys = http_build_query("idNo="+strval($idNo)+"&name="+$name);
        // $bodys = "idNo=340421190210182345&name=%E5%BC%A0%E4%B8%89";
        $url = $host . $path;

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_CUSTOMREQUEST, $method);
        curl_setopt($curl, CURLOPT_URL, $url);
        curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl, CURLOPT_FAILONERROR, false);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_HEADER, true);
        if (1 == strpos("$".$host, "https://"))
        {
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
        }
        curl_setopt($curl, CURLOPT_POSTFIELDS, $bodys);
        $a = curl_exec($curl);
        // var_dump($a);
        dump($a);
        $b = strstr($a,'{"name":');
        $c = json_decode($b,true);
//        dump($c);
//        echo $c['error_code'];
        return $c;
    }

/**
* @OA\Post(
*     path="/cq/user/sfyz",
*     tags={"用户管理"},
*     summary="身份验证接口",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="sfz", type="string",description="身份证号"),
     *                 @OA\Property(property="realname", type="string",description="真实姓名"),
     *                 example={
    *                      "sfz": "340421190210182345",
    *                      "realname": "%E5%BC%A0%E4%B8%89",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
    *                 @OA\Schema(ref="#/components/schemas/ul_order_user"),
     *             },
     *         )
     *     )
     * )
     */
    public function sfyz(){
        $data = $this->request->param();
        $select = Db::table('ul_order_user')->where('realname',$data['realname'])->where('sfz',$data['sfz'])->count();
        if($select !=0 ){
            return json(['code' => 0, 'msg' => '同一张身份证只能实名认证一个账号']);
        }else{
            if($this->isAdultByIdCard($data['sfz'])){
                $info = $this->sfzyz($data['sfz'],$data['realname']);
                // return $info;
                if($info['respCode']=="0000"){
                    $save = Db::table('ul_order_user')->where('open_id',$data['open_id'])->update($data);
                    if($save){
                        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                        return json(['code' => 200, 'msg' => $info['respMessage'],'data'=>$user_info]);
                    }
                }else{
                    return json(['code' => $info['respCode'], 'msg' => $info['respMessage']]);
                }
            }else{
                return json(['code' => 0, 'msg' => '身份证未满18岁']);
            }
        }
    }

    public function aabb(){
        $mt = Db::table("hb")
            ->where('fsrq','每天')
//            ->where('fssj',">=",date('H:i:s',strtotime('-10 min',time())))
            ->select()->toArray();//查询每天重复红包
        dump($mt);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/reg_yx_user",
     *     tags={"用户管理"},
     *     summary="游戏账号一键注册接口",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="username", type="string",description="游戏账号"),
     *                 @OA\Property(property="password", type="string",description="游戏密码"),
     *                 @OA\Property(property="nickname", type="string",description="昵称"),
     *                 @OA\Property(property="birthday", type="string",description="生日"),
     *                 @OA\Property(property="problem1", type="string",description="问题一"),
     *                 @OA\Property(property="key1", type="string",description="答案一"),
     *                 @OA\Property(property="problem2", type="string",description="问题二"),
     *                 @OA\Property(property="key2", type="string",description="答案二"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "username": "aaa",
     *                      "password": "bbb",
     *                      "nickname": "张三",
     *                      "birthday": "2023-12-12",
     *                      "problem1": "1",
     *                      "key1": "2",
     *                      "problem2": "3",
     *                      "key2": "4",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/reg_yx_user"),
     *             },
     *         )
     *     )
     * )
     */
    public function reg_yx_user(){
        $data = $this->request->param();
        if(Db::table('reg_yx_user')->where('open_id',$data['open_id'])->findOrEmpty()==[]){
            $save = Db::table('reg_yx_user')->insert($data);
        }else{
            $save = Db::table('reg_yx_user')->where('open_id',$data['open_id'])->update($data);
        }
        if($save){
            return json(['code' => 200, 'msg' => '成功']);
        }else{
            return json(['code' => 0, 'msg' => '失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_reg_yx_user",
     *     tags={"用户管理"},
     *     summary="获取游戏账号一键注册信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
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
     *                 @OA\Schema(ref="#/components/schemas/reg_yx_user"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_reg_yx_user(){
        $data = $this->request->param();
        $list = Db::table('reg_yx_user')->where('open_id',$data['open_id'])->find();
        return json(['code' => 200, 'msg' => '成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/add_yx_sc",
     *     tags={"用户管理"},
     *     summary="增加游戏时长--普通游戏",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="yxsc", type="int",description="游戏时长"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "yxsc": 1,
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxsc"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_yx_sc(){
        $data = $this->request->param();
        $res = $this->addGameTime($data);
        if($res == 2){
            return json(['code' => 200, 'msg' => '请求间隔时间不足一分钟']);
        }elseif($res == 3){
            return json(['code' => 0, 'msg' => '今日游戏时长已达到120分钟上限']);
        }else{
            return json(['code' => 200, 'msg' => '成功']);
        }
        /*$data['yxsc']=1;
        $count = Db::table('yxsc')
            ->where('open_id',$data['open_id'])
            ->where('yx_id',0)
            ->whereTime('update_time','today')
            ->count();//查询今日是否玩游戏
        if($count==0){//今日未玩普通游戏
            $save = Db::table('yxsc')->insert(['open_id'=>$data['open_id'],'yxsc'=>$data['yxsc']]);
        }else{//今日玩过游戏
            $info = Db::table('yxsc')
                ->where('open_id',$data['open_id'])
                ->whereTime('update_time','today')
                ->find();
            if(empty($info) && time()-(strtotime($info['update_time']))<60){
                return json(['code' => 1, 'msg' => '请求间隔时间不足一分钟']);
            }else{
                $save = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',0)->whereTime('update_time','today')->inc('yxsc',$data['yxsc'])->update(['update_time'=>date("Y-m-d H:i:s")]);
            }
        }
        if($save){
            $lv = Db::table('ul_user_level')->select();
            //获取游戏总时长
            $zsc1 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('yxsc');//普通游戏时长
            $zsc2 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('hf_sc');//特色好服时长
            $zsc = $zsc1+$zsc2;//总时长
            Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>'']);//将等级设置为空
            //时长换算为小时
            $sc = intval($zsc/60);
            for ($i = 0;$i<count($lv);$i++){
                $aa = Db::table('ul_user_level')->where('level',$i)->find();
                if($sc<=$aa['level_time']){
                    Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>$aa['level_name']]);//设置用户实际等级
                    break;
                }
            }
            return json(['code' => 200, 'msg' => '成功']);
        }else{
            return json(['code' => 0, 'msg' => '失败']);
        }*/
    }

    public function addGameTime($data){
        $time = date("Y-m-d H:i:s");
        $info = Db::table('yxsc')
            ->where('open_id',$data['open_id'])
            ->whereTime('update_time','today')
            ->order('update_time desc')
            ->select();
        if(count($info) > 0 && strtotime($time)-(strtotime($info[0]['update_time']))<60){
            return 2;
        }else{
            // 检查今日时长是否已达到120分钟上限
            $todayTotal = Db::table('yxsc')
                ->where('open_id',$data['open_id'])
                ->whereTime('update_time','today')
                ->sum('yxsc') + Db::table('yxsc')
                ->where('open_id',$data['open_id'])
                ->whereTime('update_time','today')
                ->sum('hf_sc');
            
            if($todayTotal >= 120){
                return 3; // 返回3表示已达到每日上限
            }

//            $time = date("Y-m-d H:i:s");
            if(array_key_exists('yx_id', $data)){
                $data['hf_sc']=1;
                $count = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->count();//获取今日游戏总时长
                if($count==0){
                    $save = Db::table('yxsc')->insert(['open_id'=>$data['open_id'],'hf_sc'=>$data['hf_sc'],'yx_id'=>$data['yx_id'],'update_time'=>$time]);
                }else{
                    $save = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->inc('hf_sc',$data['hf_sc'])->update(['update_time'=>$time]);
                }
            }else{
                $count = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',0)->whereTime('update_time','today')->count();//获取今日游戏总时长
                $data['yxsc']=1;
                if($count==0){
                    $save = Db::table('yxsc')->insert(['open_id'=>$data['open_id'],'yxsc'=>1,'update_time'=>$time]);
                }else{
                    $save = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',0)->whereTime('update_time','today')->inc('yxsc',$data['yxsc'])->update(['update_time'=>$time]);
                }
//                $save = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',0)->whereTime('update_time','today')->inc('yxsc',$data['yxsc'])->update(['update_time'=>$time]);
            }
            if($save){
                $lists = Db::table('yxsc')->where('open_id',$data['open_id'])->where('update_time',$time)->count();
                if($lists==2){
                    Db::table('yxsc')->where('open_id',$data['open_id'])->where('update_time',$time)->where('yx_id',0)->dec('yxsc',1)->update();
                }
                $lv = Db::table('ul_user_level')->select();
                //获取游戏总时长
                $zsc1 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('yxsc');//普通游戏时长
                $zsc2 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('hf_sc');//特色好服时长
                $zsc = $zsc1+$zsc2;//总时长
                Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>'']);//将等级设置为空
                //时长换算为小时
                $sc = intval($zsc/60);
                for ($i = 0;$i<count($lv);$i++){
                    $aa = Db::table('ul_user_level')->where('level',$i)->find();
                    if($sc<=$aa['level_time']){
                        Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>$aa['level_name']]);//设置用户实际等级
                        break;
                    }
                }
                return 1;
            }else{
                return 0;
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/add_hf_yx_sc",
     *     tags={"用户管理"},
     *     summary="增加游戏时长--特色好服",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="yx_id", type="int",description="游戏id"),
     *                 @OA\Property(property="hf_sc", type="int",description="好服推荐游戏时长"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "yx_id": 1,
     *                      "hf_sc": 1,
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxsc"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_hf_yx_sc(){
        $data = $this->request->param();
        $res = $this->addGameTime($data);
        if($res == 2){
            return json(['code' => 200, 'msg' => '请求间隔时间不足一分钟']);
        }else{
            return json(['code' => 200, 'msg' => '成功']);
        }
        // return json($res);
        /*$data['hf_sc']=1;
        $info = Db::table('yxsc')
            ->where('open_id',$data['open_id'])
            ->where('yxsc',0)
            ->whereTime('update_time','today')
            ->order('update_time desc')
            ->select();
        if(count($info) > 0 && time()-(strtotime($info[0]['update_time']))<60){
            return json(['code' => 1, 'msg' => '请求间隔时间不足一分钟']);
        }else{
            $count = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->count();//获取今日游戏总时长
            if($count==0){
                $save = Db::table('yxsc')->insert(['open_id'=>$data['open_id'],'hf_sc'=>$data['hf_sc'],'yx_id'=>$data['yx_id']]);
            }else{
                $save = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->inc('hf_sc',$data['hf_sc'])->update(['update_time'=>date("Y-m-d H:i:s")]);
            }

        }
        if($save){
            $lv = Db::table('ul_user_level')->select();
            //获取游戏总时长
            $zsc1 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('yxsc');//普通游戏时长
            $zsc2 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('hf_sc');//特色好服时长
            $zsc = $zsc1+$zsc2;//总时长
            Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>'']);//将等级设置为空
            //时长换算为小时
            $sc = intval($zsc/60);
            for ($i = 0;$i<count($lv);$i++){
                $aa = Db::table('ul_user_level')->where('level',$i)->find();
                // echo($aa['level_time']);
                // echo('</br>');
                if($sc<=$aa['level_time']){
                    // echo($i);
                    Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['lv'=>$aa['level_name']]);//设置用户实际等级
                    break;
                }
            }
            return json(['code' => 200, 'msg' => '成功']);
        }else{
            return json(['code' => 0, 'msg' => '失败']);
        }*/
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_user_yxsc",
     *     tags={"用户管理"},
     *     summary="获取今日游戏时长",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_user_yxsc(){
        $data = $this->request->param();
        $sum1 = Db::table('yxsc')->where('open_id',$data['open_id'])->whereTime('update_time','today')->sum('yxsc');//普通游戏时长
        $sum2 = Db::table('yxsc')->where('open_id',$data['open_id'])->whereTime('update_time','today')->sum('hf_sc');//好服游戏时长
        $sum = $sum1+$sum2;
        return json(['code' => 200, 'msg' => '成功','data'=>$sum]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_user_all_yxsc",
     *     tags={"用户管理"},
     *     summary="获取总游戏时长",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_user_all_yxsc(){
        $data = $this->request->param();
        $sum1 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('yxsc');//普通游戏时长
        $sum2 = Db::table('yxsc')->where('open_id',$data['open_id'])->sum('hf_sc');//好服游戏时长
        $sum = $sum1+$sum2;
        return json(['code' => 200, 'msg' => '成功','data'=>$sum]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_user_yxsc_ts",
     *     tags={"用户管理"},
     *     summary="获取今日好服推荐游戏时长",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="yx_id", type="string",description="yx_id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "yx_id": 28,
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_user_yxsc_ts(){
        $data = $this->request->param();
        $sum = Db::table('yxsc')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->sum('hf_sc');//好服游戏时长
        return json(['code' => 200, 'msg' => '成功','data'=>$sum]);
    }

    public function ttt(){
        $lv = Db::table('ul_user_level')->select()->toArray();
        for ($i = 0;$i<count($lv);$i++){
            if($i=3){
                return $lv[$i]['level_name'];
                break;
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/look_yx",
     *     tags={"用户管理"},
     *     summary="添加游戏浏览记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="yx_id", type="string",description="游戏列表id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "yx_id": 1,
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function look_yx(){
        $data = $this->request->param();
        $operation = operation_info();
        $count = Db::table('look_yx')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->whereTime('update_time','today')->count();
        if($count==0){
            Db::table('look_yx')->insert($data);
            if(Db::table('look_yx')->where('open_id',$data['open_id'])->whereTime('update_time','today')->count()==$operation['lookGameNumber']){
                $coin_count = Db::table('coin_info')->where('open_id',$data['open_id'])->whereTime('updata_time','today')->where('fs','每日浏览游戏')->count();
                if($coin_count==0){
                    Db::table('coin_info')->insert(['open_id'=>$data['open_id'],'fs'=>'每日浏览游戏','coin_num'=>$operation['lookGame'],'code'=>0]);
                    Db::table('ul_order_user')
                        ->where('open_id',$data['open_id'])
                        ->inc('coin_num',$operation['lookGame'])
                        ->update();
                }
            }
            return json(['code' => 200, 'msg' => '成功']);
        }else{
            return json(['code' => 0, 'msg' => '该游戏已浏览']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_look_yx",
     *     tags={"用户管理"},
     *     summary="获取每日浏览游戏次数",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_look_yx(){
        $data = $this->request->param();
        $count = Db::table('look_yx')->where('open_id',$data['open_id'])->whereTime('update_time','today')->count();
        return json(['code' => 200, 'msg' => '成功','count'=>$count]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/update_online",
     *     tags={"用户管理"},
     *     summary="关闭盒子用户下线",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function update_online(){
        $data = $this->request->param();
//        return $data;
        $save = Db::table('ul_order_user')->where('open_id',$data['open_id'])->update(['is_online'=>1]);
        if($save){
            return json(['code' => 200, 'msg' => '成功']);
        }else{
            return json(['code' => 0, 'msg' => '失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_order_list",
     *     tags={"用户管理"},
     *     summary="当前用户充值订单记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="int",description="open_id"),
     *                 @OA\Property(property="pageNum", type="int",description="pageNum"),
     *                 @OA\Property(property="pageSize", type="int",description="pageSize"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "pageNum": 1,
     *                      "pageSize": 10,
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxcz"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_order_list(){
        $data = $this->request->param();
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $limit = Db::table('yxcz')
            ->where('open_id',$data['open_id'])
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('yxcz')
            ->page($page,$count)
            ->where('open_id',$data['open_id'])
            ->order('update_time desc')
            ->select();
        return json(['code' => 200, 'msg' => '成功','list'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    public function get_order_list2(){
        $data = $this->request->param();
        $page = $this->request->param('page');
        $count = $this->request->param('limit');
        $limit = Db::table('yxcz')
            ->where('open_id',$data['open_id'])
            ->count();
        $limits = ceil($limit/$count);
        $list = Db::table('yxcz')
            ->page($page,$count)
            ->where('open_id',$data['open_id'])
            ->order('update_time desc')
            ->select();
        return json(['code' => 200, 'msg' => '成功','list'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_hzlq_info",
     *     tags={"用户管理"},
     *     summary="查询指定用户单日金币获取情况",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 @OA\Property(property="fs", type="string",description="fs"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "fs": "白银宝箱",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_hzlq_info(){
        $data = $this->request->param();
        //宝箱领取情况
        $count = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs',$data['fs'])->whereTime('updata_time','today')->count();
        if($count==0){
            return json(['code' => 200, 'msg' => '未领取','data'=>0]);
        }else{
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs',$data['fs'])->whereTime('updata_time','today')->find();
            return json(['code' => 200, 'msg' => '已领取','data'=>1,'info'=>$info]);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/user/get_bxlq_info",
     *     tags={"用户管理"},
     *     summary="查询宝箱领取情况",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="open_id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */
    public function get_bxlq_info(){
        $data = $this->request->param();
        /*dump($data);
        return;*/
        //白银宝箱领取情况
        $by_count = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->count();
        //黄金宝箱领取情况
        $hj_count = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->count();
        //铂金宝箱领取情况
        $bj_count = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->count();
        //钻石宝箱领取情况
        $zs_count = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->count();
        return json(['code' => 200, 'msg' => '领取情况','data'=>['by'=>$by_count,'hj'=>$hj_count,'bj'=>$bj_count,'zs'=>$zs_count]]);
    }
    
    public function isAdultByIdCard($idCard) {
        if (strlen($idCard) != 18) {
            return false; // 身份证号码必须是18位
        }
        $year = substr($idCard, 6, 4); // 获取出生年份
        $month = substr($idCard, 10, 2); // 获取出生月份
        $day = substr($idCard, 12, 2); // 获取出生日期
        $today = date("Y-m-d"); // 获取当前日期
        $todayYear = date("Y");
        $todayMonth = date("m");
        $todayDay = date("d");
     
        // 计算今年的生日是否已经过了
        if ($month > $todayMonth || ($month == $todayMonth && $day > $todayDay) || $year > $todayYear) {
            $year = $year + 18; // 假设还没过生日则年龄增加18岁
        }
     
        return $year - 18 > 0; // 比较年龄是否达到18岁
    }

    /*
     * 根据open_id获取用户信息
     * */
    public function get_info(){
        $data = $this->request->param();
        $info = Db::table('ul_order_user')->where('id',$data['id'])->find();
        return json($info);
    }

    public function getRedPacket(){
        $data = $this->request->param();
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
        $list = array_merge($list1,$list2);
        if (array_key_exists('open_id', $data)) {
            foreach ($list as $k2 => $v2){
                $info = Db::table('coin_info')->where('hb_id',$v2['id'])->where('open_id',$data['open_id'])->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $list[$k2]['is_lq'] = 0;
                }else{
                    $list[$k2]['is_lq'] = 1;
                    $list[$k2]['coin_num'] = $info['coin_num'];
                    $list[$k2]['real'] = $info['real'];
                    $list[$k2]['difference'] = $info['difference'];
                }

            }
        }
//        dump($list);
        return json(['code'=>200,'msg'=>'红包列表','data'=>$list]);
    }
    
    public function getWechatInfo(){
        $openId = $this->request->param('open_id');
        $config = Config::get('wechat');
        $app = Factory::officialAccount($config);
        $accessToken = $app->access_token;
        $token = $accessToken->getToken(); // token 数组  token['access_token'] 字符串
        /*$GetUserInfo = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$token['access_token'].'&openid='.$openId.'&lang=zh_CN"';
        $UserInfo = file_get_contents($GetUserInfo);*/
//        $user = $app->user->get($openId);
        dump($token) ;
    }
    
    /**
     * @OA\Post(
     *     path="/cq/user/getHbReceive",
     *     tags={"用户管理"},
     *     summary="获取红包领取情况",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                  @OA\Property(property="id",type="string",description="id"),
     *                  @OA\Property(property="open_id",type="string",description="open_id"),
     *                  example={
     *                      "id": "3",
     *                      "open_id":"open_id"
     *                  }
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
    public function getHbReceive(){
        $data = $this->request->param();
        $info = Db::table("hb")->where('id',$data['id'])->findOrEmpty();
        if(!empty($info)){
            if($info['type']==0){
                $hb = Db::table("coin_info")->where('open_id',$data['open_id'])->where('hb_id',$data['id'])->findOrEmpty();
                if(!empty($hb)){
                    return json(['code'=>200,'msg'=>'红包该红包已领取','data'=>['status'=>0,'amount'=>$hb['coin_num']]]);
                }else{
                    return json(['code'=>200,'msg'=>'红包未领取','data'=>['status'=>1]]);
                }
            }else{
                $hb = Db::table("coin_info")->where('open_id',$data['open_id'])->where('hb_id',$data['id'])->whereTime('updata_time','today')->findOrEmpty();
                if(!empty($hb)){
                    return json(['code'=>200,'msg'=>'红包该红包已领取','data'=>['status'=>0,'amount'=>$hb['coin_num']]]);
                }else{
                    return json(['code'=>200,'msg'=>'红包未领取','data'=>['status'=>1]]);
                }
            }
        }else{
            return json(['code'=>0,'msg'=>'红包不存在']);
        }
    }
    /**
     * @OA\Post(
     *     path="/cq/user/getSbkCode",
     *     tags={"用户管理"},
     *     summary="判断当前沙巴克是否有激活码",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                  @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                  @OA\Property(property="open_id",type="string",description="用户open_id"),
     *                  example={
     *                      "id": "3",
     *                      "open_id":"open_id"
     *                  }
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
    public function getSbkCode(){
        $data = $this->request->param();
        $info = Db::table('jhm')->where('sbk_id',$data['id'])->where('open_id',$data['open_id'])->findOrEmpty();
        if(!empty($info)){
            return json(['code'=>200,'msg'=>'获取成功','data'=>['code'=>$info['jhm'],'sbk_id'=>$info['sbk_id'],'state'=>$info['is_sy']]]);
        }else{
            return json(['code'=>200,'data'=>null]);
        }
    }
    
    
    /**
     * @return void
     * 收藏和取消收藏
     * 2024-08-19
     * path="/cq/user/collect",
     * open_id 用户openID
     * state 1收藏 2取消收藏
     * sID 收藏的服务器ID
     * createTime 收藏时间
     */
    public function collect(){
        $data = $this->request->param();
        if($data['state']==1){
            $save = Db::table('collect')->insert(['open_id'=>$data['open_id'],'sID'=>$data['sID']]);
            if($save){
                return json(['code'=>200,'msg'=>'收藏成功']);
            }else{
                return json(['code'=>0,'msg'=>'收藏失败']);
            }
        }else{
            $save = Db::table('collect')->where('open_id',$data['open_id'])->where('sID',$data['sID'])->delete();
            if($save){
                return json(['code'=>200,'msg'=>'取消收藏成功']);
            }else{
                return json(['code'=>0,'msg'=>'取消收藏失败']);
            }
        }
    }

    /**
     * @return void
     * 获取收藏列表
     * 2024-08-19
     * path="/cq/user/getCollect",
     * open_id 用户openID
     */
    public function getCollect(){
        $data = $this->request->param();
        $list = Db::table('collect')->where('open_id',$data['open_id'])->select();
        if($list) {
            foreach ($list as &$value) {
                $info = Db::table("xftj")->where('id', $value['sID'])->findOrEmpty();
                $value['serverName'] = $info['serverName'];
                $value['serverIp'] = $info['serverIp'];
                $value['openTime'] = $info['openTime'];
                $value['QQ'] = $info['QQ'];
                $value['route'] = $info['route'];
                $value['version'] = $info['version'];
                $value['homeUrl'] = $info['homeUrl'];
                $value['listUrl'] = $info['listUrl'];
                $value['engine'] = $info['engine'];
                $value['show'] = $info['show'];
                $value['expiresTime'] = $info['expiresTime'];
                $value['addUser'] = $info['addUser'];
                $value['site'] = $info['site'];
                $value['downUrl'] = $info['downUrl'];
            }
            return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
        }else{
            return json(['code'=>0,'msg'=>'暂无数据']);
        }

    }
    
    /*
     * 测试专用
     * */
    public function abc(){
        $a = time()+7200;
        echo date('Y-m-d h:i:s',$a);
    }
    
    public function sfzcs(){
        $data = $this->request->param();
        $info = $this->sfzyz($data['sfz'],$data['realname']);
        return json($info);
    }
    public function cx(){
        $data = \cache('oWpvM6VWrGoKKWps7aj-fD9YkneA');
        return json($data);
    }
    public function sc(){
        $ip = Request::header('x-forwarded-for');
        $clientIP = explode(',', $ip)[0] ?? '';
        cache($clientIP,'1234',3600);
        $data = \cache($clientIP);
        return json($data);
    }
    public function encryptData($data, $method = 'AES-256-CBC', $key = 'your_secret_key', $iv = '') {
        // 如果未提供IV，则随机生成
        if (empty($iv)) {
            $iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length($method));
        }

        // 加密数据
        $encrypted = openssl_encrypt($data, $method, $key, 0, $iv);

        // 返回IV和加密数据的组合，通常用于解密时恢复IV
        return base64_encode($iv . $encrypted);
    }
    public function decryptData($data, $method = 'AES-256-CBC', $key = 'your_secret_key') {
        // 解码数据
        $data = base64_decode($data);

        // 提取IV
        $ivLength = openssl_cipher_iv_length($method);
        $iv = substr($data, 0, $ivLength);
        $encryptedData = substr($data, $ivLength);

        // 解密数据
        $decrypted = openssl_decrypt($encryptedData, $method, $key, 0, $iv);

        return $decrypted;
    }
    public function ddd(){
        $originalData = 'oWpvM6e8jXkKxApR_zuMCycp3AzY';
        $encryptedData = $this->encryptData($originalData);
        echo "Encrypted: " . $encryptedData . "\n";

        $decryptedData = $this->decryptData($encryptedData);
        echo "Decrypted: " . $decryptedData . "\n";
    }
    public function test1(){
        $data = $this->request->param();
        $data1 = [
            'id' => 11111,
        ];
        $jobId = Queue::push('app\cq\Job\AsyncJob@task1',$data1);
        $iterations = 10; // 假设您希望每分钟执行60次
        $interval = 1; // 每次执行的间隔时间（秒）
        for ($i=0;$i<=$iterations;$i++){
            echo $iterations;
            sleep($interval);
            if(Cache::has('queue_'.$jobId)){
                return json(['status' => 'queued', 'job_id' => $jobId,'data'=>$data,'data1'=>$data1]);
            }elseif($i==$iterations){
                return json(['status' => 'queued', 'job_id' => $jobId,'data'=>$data]);
            }
        }

    }
    /*新增的抽奖接口*/
    public function startLucky(){
        $data = $this->request->param();
        $operation_info = Db::table('operation')->find(1);//运营参数
        //获取用户信息
        $userinfo = Db::table('ul_order_user')->where('open_id',$data['open_id'])->findOrEmpty();
        //判断用户是否存在
        if(empty($userinfo)){
            return json(['code' => 0, 'msg' => '用户不存在']);
        }
        //判断是金币抽奖还是实物抽奖
        if(array_key_exists('type', $data) && $data['type'] = 1){
            $dir = floatval($operation_info['luckCoinConsume']);
            $type = 15;
            $fs = '金币抽奖';
            $luckyInfo = Db::table('luckyCoin')->find(1);
            $str = 'luckyCoinItemProb';
            $title = 'luckyCoinItemTitle';
        }elseif(array_key_exists('type', $data) && $data['type'] = 2){
            $dir = floatval($operation_info['luckPrizeCoinConsume']);
            $type = 16;
            $fs = '实物抽奖';
            $luckyInfo = Db::table('luckyPrize')->find(1);
            $str = 'luckyPrizeItemProb';
            $title = 'luckyPrizeItemTitle';
        }else{
            return json(['code' => 400, 'msg' => '非法访问']);
        }
        //判断金币是否足够
        if(floatval($userinfo['coin_num'])<$dir){
            return json(['code' => 0, 'msg' => '金币不足']);
        }
        //扣除金币
        $addData = [
            'open_id'=>$data['open_id'],
            'coin_num'=>intval($dir),
            'type'=>$type,
            'code'=>1,
            'fs'=>$fs,
            'title'=>$fs
        ];
        $coininfoID = Db::table('coin_info')->insertGetId($addData);
        if($coininfoID<=0){
            return json(['code' => 0, 'msg' => '金币扣除失败']);
        }
        $updateUserInfo = Db::table('ul_order_user')->where('open_id',$data['open_id'])->dec('coin_num',$dir)->update();
        if(!$updateUserInfo){
            return json(['code' => 0, 'msg' => '金币扣除失败']);
        }
        //组装奖品信息
        $resultArray = $this->transformArray($luckyInfo,$str);
        $amounts = array_column($resultArray, 'probability');
        // 使用array_sum计算总和
        $sum = array_sum($amounts);
        //开始抽奖逻辑  中奖奖品标识为$winningPrize['name']
        $randomNumber = mt_rand(1, $sum);
        $cumulativeProbability = 0;
        foreach ($resultArray as $prize) {
            $cumulativeProbability += $prize['probability'];
            if ($randomNumber <= $cumulativeProbability) {
                $winningPrize = $prize;
                break;
            }
        }
//        return $winningPrize['name'];
        //判断是否未中奖
//        echo $luckyInfo[$title.$winningPrize['name']];
        if(strpos($luckyInfo[$title.$winningPrize['name']],'谢谢')!== false){
            return json(['code' => 200, 'msg' => '成功','prize'=>$winningPrize['name'],'userInfo'=>$userinfo]);
        }else{
            //判断是否为实物
            if(strpos($luckyInfo[$title.$winningPrize['name']],'倍') !== false || strpos($luckyInfo[$title.$winningPrize['name']],'金币')!== false){
                if(strpos($luckyInfo[$title.$winningPrize['name']],'倍')!== false){
                    $coin_num = floatval($luckyInfo['luckyCoinItemNumber'.$winningPrize['name']])* $dir;
                }else{
                    $string = $luckyInfo['luckyPrizeItemTitle'.$winningPrize['name']];
                    $pattern = '/\d+/'; // 匹配一个或多个数字
                    if (preg_match($pattern, $string, $matches)) {
                        $coin_num = $matches[0]; // $matches[0] 将包含第一个匹配的数字
                    } else {
                        $coin_num = 0; // 如果没有找到数字，则默认为0或其他适当的值
                    }
                }
                $info = Db::table('ul_user_level')->where('level_name',$userinfo['lv'])->find();//等级信息
                $coount = Db::table('coin_info')->whereTime('updata_time','today')->where('code',0)->where('open_id',$data['open_id'])->sum('coin_num');//今日获得的金币数量
                if((intval($info['coin_up'])-intval($coount))>0){//未达到领取上限
                    if((intval($info['coin_up'])-intval($coount))>intval($coin_num)){//当前金币未超出限制
                        $coin_num1 = floatval($coin_num)*floatval($info['coin_scale'])/100;
                    }else{//当前金币已超出限制
                        $coin_num1 = (floatval($info['coin_up'])-floatval($coount))*floatval($info['coin_scale'])/100;//按等级计算可获得金币数
                    }
                }else{//达到领取上限
                    $coin_num1 = 0;
                }
                $difference = floatval($coin_num1) - floatval($coin_num);
                $addCoinData = [
                    'open_id'=>$data['open_id'],
                    'coin_num'=>$coin_num1,
                    'type'=>$type,
                    'code'=>0,
                    'fs'=>$fs,
                    'title'=>$fs,
                    'real'=>$coin_num,
                    'difference'=>$difference
                ];
                $addID = Db::table('coin_info')->insertGetId($addCoinData);
                if($addID<=0){
                    $updateUserInfoadd = Db::table('ul_order_user')->where('open_id',$data['open_id'])->inc('coin_num',$dir)->update();
                    return json(['code' => 0, 'msg' => '奖品信息错误']);
                }
                $coinInfo = Db::table('coin_info')->find($addID);
                return json(['code' => 200, 'msg' => '成功','prize'=>$winningPrize['name'],'data'=>$coinInfo,'userInfo'=>$userinfo]);
            }
            //生成实物订单
            $addOrderData = [
                'order_id'=> md5(time().$data['open_id']),
                'order_user_id' => $userinfo['id'],
                'order_user_name' => $userinfo['name'],
                'order_user_photo' => $userinfo['avatar'],
                'coin_goods_id' => 0,
                'order_type' => 2,
                'order_statu' => 3
            ];
            $addOrderID = Db::table('ul_coin_order')->insertGetId($addOrderData);
            if($addOrderID<=0){
                $updateUserInfoadd = Db::table('ul_order_user')->where('open_id',$data['open_id'])->inc('coin_num',$dir)->update();
                return json(['code' => 0, 'msg' => '抽奖失败']);
            }
            $prizeOrderInfo = Db::table('ul_coin_order')->find($addOrderID);
            $addCoinData = [
                'open_id'=>$data['open_id'],
                'coin_num'=>0,
                'type'=>$type,
                'code'=>0,
                'fs'=>$fs,
                'is_sw'=>1,
                'title'=>$luckyInfo[$title.$winningPrize['name']],
                'real'=>0,
                'difference'=>0
            ];
            $addID = Db::table('coin_info')->insertGetId($addCoinData);
            if($addID<=0){
//                $updateUserInfoadd = Db::table('ul_order_user')->where('open_id',$data['open_id'])->inc('coin_num',$dir)->update();
                return json(['code' => 0, 'msg' => '抽奖失败']);
            }
            $coinInfo = Db::table('coin_info')->find($addID);
            return json(['code' => 200, 'msg' => '成功','prize'=>$winningPrize['name'],'data'=>$coinInfo,'prizeOrder'=>$prizeOrderInfo,'userInfo'=>$userinfo]);
        }
    }

    //转换抽奖配置数组
    function transformArray($originalArray,$str) {
        $transformedArray = [];
        for ($i = 0;$i<8;$i++){
            $transformedArray[$i]['name'] = $i+1;
            $transformedArray[$i]['probability'] = intval($originalArray[$str.$i+1]);
        }
        /*$counter = 1;
        // 遍历原始数组
        foreach ($originalArray as $key => $value) {
            // 检查键是否以包含指定字符，并且值是数字
            if (strpos($key,$str)) {
                // 构建新数组元素并添加到结果数组中
                $transformedArray[] = [
                    'name' => $counter,
                    'probability' => intval($value) // 确保probability是整数
                ];
                $counter++; // 增加计数器以用于下一个奖品的命名
            }
        }*/

        return $transformedArray;
    }
}