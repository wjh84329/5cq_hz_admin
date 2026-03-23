<?php
declare (strict_types = 1);

namespace app\cq\controller;

use app\BaseController;
use think\facade\Request;
use think\facade\Cache;
use think\facade\Config;
use think\facade\Db;
use think\facade\Env;
use think\facade\Session;
use EasyWeChat\OfficialAccount\Application;
use app\common\service\UploadService;
use think\facade\View;
use EasyWeChat\Factory;
use think\facade\Log;
use think\cache\driver\Redis;
/**
 * @OA\Info(
 *     title="CQ5接口文档",
 *     version="1.0.1",
 *     description="服务端API",
 *     description="CQ5接口文档",
 *
 * )
 */
class Index extends BaseController
{

    public function index(){
        return view('index');
    }

    public function loginCode($uid)
    {
        $config = Config::get('wechat');
        $app = Factory::officialAccount($config);
        $result = $app->qrcode->temporary($uid, 600);

        $url = $app->qrcode->url($result['ticket']);
        return $url;

    }
    /**
     * @OA\Post(path="/cq/index/rm_yx_list",
     *   tags={"首页渲染"},
     *   summary="热门游戏列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function rm_yx_list(){
        $list = Db::table('ul_yxlb')->where('is_rm',0)->where('is_ts',1)->order('create_time desc')->limit(3)->select();
            $data = array(
                'code'=>200,
                'msg'=>'热门游戏列表',
                'list'=>$list
            );
            return json($data);

    }

    /**
     * @OA\Post(path="/cq/index/tj_yx_list",
     *   tags={"首页渲染"},
     *   summary="推荐游戏列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function tj_yx_list(){
        $list = Db::table('ul_yxlb')->where('is_tj',0)->where('is_ts',1)->order('create_time desc')->limit(3)->select();

            $data = array(
                'code'=>200,
                'msg'=>'推荐游戏列表',
                'list'=>$list
            );
            return json($data);
    }

    /**
     * @OA\Post(path="/cq/index/dzy_yx_list",
     *   tags={"首页渲染"},
     *   summary="单职业游戏列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function dzy_yx_list(){
        $list = Db::table('ul_yxlb')->where('zylx','单职业')->where('is_ts',1)->order('create_time desc')->limit(3)->select();
            $data = array(
                'code'=>200,
                'msg'=>'单职业游戏列表',
                'list'=>$list
            );
            return json($data);

    }

    /**
     * @OA\Post(path="/cq/index/szy_yx_list",
     *   tags={"首页渲染"},
     *   summary="三职业游戏列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function szy_yx_list(){
        $list = Db::table('ul_yxlb')->where('zylx','三职业')->where('is_ts',1)->order('create_time desc')->limit(3)->select();
            $data = array(
                'code'=>200,
                'msg'=>'三职业游戏列表',
                'list'=>$list
            );
            return json($data);

    }

    /**
     * @OA\Post(
     *     path="/cq/index/yyxq",
     *     tags={"首页渲染"},
     *     summary="游戏详情",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(
     *                     property="id",
     *                     type="string",
     *                     description="游戏ID"
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
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */

    public function yyxq($id){
        $inf0 = Db::table('ul_yxlb')->find($id);
        return json(['code'=>200,'msg'=>'游戏详情','list'=>$inf0]);
    }

    /**
     * @OA\Post(
     *     path="/cq/index/get_hzlm",
     *     tags={"首页渲染"},
     *     summary="获取盒子首页栏目",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *     )
     * )
     */

    public function get_hzlm(){
        $list = Db::table('hzlm')->where('is_xs',1)->order('sort asc')->select();
        return json(['code'=>200,'msg'=>'栏目','list'=>$list]);
    }

    public function user_session(){
        Session::set('open_id','ociWS6mqBH6uevoMMi6FfBiBCZCE');
        return json(Session::get('open_id'));
    }
    public function use_session(){
        return json(Session::get('open_id'));
    }

    /**
     * @OA\Post(path="/cq/index/hd",
     *   tags={"首页渲染"},
     *   summary="首页活动展示",
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
    public  function hd(){
        $list = Db::table('ul_play')->where('banner_statu',0)->select();
        return json(['code'=>200,'msg'=>'首页活动展示','list'=>$list]);
    }

    public  function banner(){
        $list = Db::table('ul_yxlb')->where('is_sy',0)->select();
        return json(['code'=>200,'msg'=>'首页活动展示','list'=>$list]);
    }

    /**
     * post: 严格校验当前轻轻是否为post
     * path:checkPostRequest
     * method:POST
     */
    public function checkPostRequest()
    {
        if (!$this->request->isPost()) {
            return json(['code'=>0,'msg'=>'当前请求不合法']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/index/upload",
     *     tags={"首页渲染"},
     *     summary="文件上传",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="multipart/form-data",
     *             @OA\Schema(
     *                 @OA\Property(
     *                     property="file",
     *                     type="file"
     *                 ),
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/file"),
     *             },
     *         )
     *     )
     * )
     */
    public function upload(){
//        $this->checkPostRequest();
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('file'),
        ];

        try {

            $upload_service = new UploadService($data['upload_type']);


            $result = $upload_service->save($data['file']);
        } catch (\Exception $e) {
//            $this->error($e->getMessage());
            return json(['code'=>0,'msg'=>$e->getMessage()]);
        }
        return json(['code'=>200,'msg'=>'上传成功','data'=>$result]);
    }

    public function test(){
        $key = $this->request->param('key');
        $reg  =  Db::table('reg')->where('key',$key)->find();
        $open_id = $reg['open_id'];
        return $open_id;
    }

    /**
     * @OA\Post(
     *     path="/cq/index/button",
     *     tags={"首页渲染"},
     *     summary="按钮请求接口",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="string",description="沙巴克ID"),
     *                 example={
     *                      "id": "2",
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
    public function button(){
        $data = $this->request->param();
        return json(['code'=>200,'msg'=>'成功','data'=>$data]);
    }
    public function edit_json(){
        $value = $data = $this->request->param("value");
        /*$files = scandirFolder("./update/");
        $key = array_search("updates.json",$files);
        $file = $files[$key];
        return json(['code'=>200,'msg'=>'成功','data'=>$file]);*/
        // 更新文件的路径
        $filePath = root_path() . 'public' . DIRECTORY_SEPARATOR . 'update' . DIRECTORY_SEPARATOR . 'updates.json';

        // 读取文件内容
        $jsonContent = file_get_contents($filePath);

        // 将JSON内容转换为PHP数组
        $data = json_decode($jsonContent, true); // 第二个参数为true，返回数组；否则返回对象

        if ($data === null) {
            // JSON解析失败
            return json(['error' => 'JSON解析失败']);
        }

        // 修改某个值，例如修改键为'keyToModify'的值
        $data['oldversion'] = $value;

        // 将数组转换回JSON字符串
        $newJsonContent = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT); // 可以添加选项使输出更易读

        // 将新的JSON内容写回文件
        file_put_contents($filePath, $newJsonContent);

        // 返回成功消息
        return json(['code'=>200,'msg'=>'成功']);
    }
    /**
     * @OA\Post(
     *     path="/cq/index/addClientLog",
     *     tags={"首页渲染"},
     *     summary="前端提交日志",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="test",type="string",description="参数"),
     *                 example={
     *                      "test": "这是一个参数",
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
    public function addClientLog(){
        // 获取请求信息
        $request = request();
        $requestData = [
            'method' => $request->method(),
            'url' => $request->url(),
            'param' => $request->param(),
        ];

        // 记录日志
        Log::channel('info_channel')->write('Request data: ' . json_encode($requestData), 'client');
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
    public function getip(){
        $ip = Request::header('x-forwarded-for');
        $clientIP = explode(',', $ip)[0] ?? '';
        return $clientIP;
    }
}
