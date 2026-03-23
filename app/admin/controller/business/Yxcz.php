<?php


namespace app\admin\controller\business;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use app\Request;
use EasyWeChat\Factory;
use think\App;
use think\facade\Config;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Yxcz extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            $page = $this->request->param('page');
            $limit = $this->request->param('$limit');
            $count = Db::table('yxcz')->count();
            $list = Db::table('yxcz')
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

    public function delete(Request $request){
        $id=$request->param('id');
        if(Db::table('yxcz')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function sh($id){
        $save = Db::table('yxcz')->where('id',$id)->update(['is_cz'=>1]);
        $info = Db::table('yxcz')->find($id);
        $user_info = Db::table('ul_order_user')->where('open_id',$info['open_id'])->find();
        if($save){
            $data_list = Db::table('api_config')->where('id',1)->find();
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
            $data = [
                'touser'=>$info['open_id'],
                'template_id' => $data_list['template_id'],
                /*'miniprogram' => [
                    'appid' => $data_list['miniprogram_appid'],
                ],*/
                'data' => [
                    'first' => '尊敬的会员，您已成功充值。',
                    'keyword1' => $info['update_time'],
                    'keyword2' => '玩传奇盒子',
                    'keyword3' => $info['czje'],
                ],
            ];
            $app->template_message->send($data);
            $this->success('操作成功');
        }

    }
    public function edit($id)
    {

        $czinfo = Db::table('yxcz')->find($id);//充值信息
        $userinfo = Db::table('ul_order_user')
            ->where('open_id',$czinfo['open_id'])->findOrEmpty();//用户信息
        $coinAddList = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('code',0)->count();//金币列表增加总条数
        $coinAddTotal = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('code',0)->sum('coin_num');//金币列表增加总和
        $coinDecList = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('code',1)->count();//金币列表减少总条数
        $coinDecTotal = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('code',1)->sum('coin_num');//金币列表减少总和
        $coinCzCount = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('title','金币兑换余额')->count();//金币充值总条数
        $coinCzTotal = Db::table('moneyInfo')
            ->where('open_id',$czinfo['open_id'])->where('code',0)->sum('money');//金币充值总数
        $coinCzCoin = Db::table('coin_info')
            ->where('open_id',$czinfo['open_id'])->where('title','金币兑换余额')->sum('coin_num');//金币充值累计消耗
        $Czcount = Db::table('yxcz')
            ->where('open_id',$czinfo['open_id'])->count();//累计充值次数
        $CzCgCount = Db::table('yxcz')
            ->where('open_id',$czinfo['open_id'])->where('is_cz',1)->count();//累计充值成功次数
        $CzCgMoney = Db::table('yxcz')
            ->where('open_id',$czinfo['open_id'])->where('is_cz',1)->sum('czje');//累计充值成功金额
        return $this->fetch('edit',[
            'czinfo'=>$czinfo,'userinfo'=>$userinfo,'coinAddList'=>$coinAddList,'coinAddTotal'=>$coinAddTotal,
            'coinDecList'=>$coinDecList,'coinDecTotal'=>$coinDecTotal,'coinCzCount'=>$coinCzCount,
            'coinCzTotal'=>$coinCzTotal,'coinCzCoin'=>$coinCzCoin,'Czcount'=>$Czcount,'CzCgCount'=>$CzCgCount,'CzCgMoney'=>$CzCgMoney
        ]);
    }
    
    public function getData(){
        $data = $this->request->param();
        $page = $data['page'];
        $limit = $data['limit'];
        $list = Db::table('coin_info')->where('open_id',$data['open_id'])->page($page,$limit)->select();
        $response =  [
            'code' => 0,
            'msg' => '',
            'count' => Db::table('coin_info')->where('open_id',$data['open_id'])->count(),
            'data' => $list,
        ];

        return json($response);
    }
    public function th($id){
        $list = Db::table('yxcz')->find($id);
        if ($this->request->isPost()) {
            $data['info']= $this->request->param('info');
            $data['id']= $this->request->param('id');
            $info = Db::table('yxcz')->where('id',$id)->find();
            $data['is_cz']= 2;
//            $data['smsCode']= $this->request->param('smsCode');
            // 开启事务
            Db::startTrans();
            try {
                // 更新yxcz表
                $update1 = Db::table('yxcz')->where('id', $id)->update($data);
                if (!$update1) {
                    throw new Exception('更新yxcz表失败');
                }
            
                // 更新ul_order_user表，增加金额
                $update2 = Db::table('ul_order_user')
                    ->where('open_id', $info['open_id'])
                    ->Inc('money', floatval($info['czje']))
                    ->update();
                // 注意：inc方法返回的是影响的行数，如果为0，可能是没有找到该open_id的记录，或者金额没有变化。
                if ($update2 === false) {
                    throw new Exception('更新用户余额失败');
                }
            
                // 提交事务
                Db::commit();
                return json(['code' => 1, 'msg' => '退回成功']);
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();
                return json(['code' => 0, 'msg' => '退回失败：' . $e->getMessage()]);
            }
        }
        return $this->fetch('th',['list'=>$list]);
    }
}
