<?php

namespace app\cq\controller;

use app\BaseController;
use think\facade\Db;
/**
 * swagger: 金币商城相关接口
 */
class Goods extends BaseController
{
    /**
     * @OA\Post(
     *     path="/cq/goods/goods_list",
     *     tags={"金币商城"},
     *     summary="商城物品列表-分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="pageNum", type="int"),
     *                 @OA\Property(property="pageSize", type="int"),
     *                 example={
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_goods"),
     *             },
     *         )
     *     )
     * )
     */
    public function goods_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $list = Db::table('ul_coin_goods')->page($page, $count)->order('sort desc')->select()->toArray();
        return json(['code'=>200,'msg'=>'商城物品列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/goods_list_no",
     *     tags={"金币商城"},
     *     summary="商城物品列表-不分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="type", type="int"),
     *                 example={
     *                      "type": "0",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_goods"),
     *             },
     *         )
     *     )
     * )
     */
    public function goods_list_no(){
        $type = $this->request->param('type');
        switch ($type){
            case 0:
                $list = Db::table('ul_coin_goods')->where('type',0)->order('sort desc')->select()->toArray();
                break;
            case 1:
                $list = Db::table('ul_coin_goods')->where('type',1)->order('sort desc')->select()->toArray();
                break;
            default:
                $list = Db::table('ul_coin_goods')->order('sort desc')->select()->toArray();
        }
        return json(['code'=>200,'msg'=>'商城物品列表','data'=>$list,'type'=>$type]);
    }
    public function sss(){
        $type = $this->request->param('type');
        echo $type;

    }

    /**
     * @OA\Post(
     *     path="/cq/goods/add_order",
     *     tags={"金币商城"},
     *     summary="生成普通订单",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string"),
     *                 @OA\Property(property="coin_goods_id", type="int"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "coin_goods_id": "1",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_order(){
        $data = $this->request->param();
        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->findOrEmpty();
        if(empty($user_info)){
            return json(['code'=>0,'msg'=>'用户不存在']);
        }
        if($user_info['phone'] == ''  || $user_info['phone']== null){
            return json(['code'=>0,'msg'=>'未绑定手机号']);
        }
        if($user_info['sfz'] == ''  || $user_info['sfz']== null){
            return json(['code'=>0,'msg'=>'未进行实名认证']);
        }
        $goods_info = Db::table('ul_coin_goods')->where('id',$data['coin_goods_id'])->findOrEmpty();
        if(empty($goods_info)){
            return json(['code'=>0,'msg'=>'商品不存在']);
        }
        // if($user_info['coin_num'] < $goods_info['price']){
        //     return json(['code'=>0,'msg'=>'金币不足']);
        // }
        $data['order_id'] = md5(time());//订单号
        $data['order_user_id'] = $user_info['id'];//下单用户id
        $data['order_user_name'] = $user_info['name'];//下单用户姓名
        $data['order_user_photo'] = $user_info['avatar'];//下单用户头像
        $data['coin_goods_title'] = $goods_info['title'];//下单商品名称
        $data['coin_goods_img'] = $goods_info['img'];//下单商品图片
        $save = Db::table('ul_coin_order')->insert($data);
        if($save){
            Db::table('ul_coin_goods')->where('id',$data['coin_goods_id'])->dec('num',1)->update();
            Db::table('ul_coin_goods')->where('id',$data['coin_goods_id'])->inc('sold',1)->update();
            return json(['code'=>200,'msg'=>'成功']);
        }else{
            return json(['code'=>0,'msg'=>'失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/add_cj_order",
     *     tags={"金币商城"},
     *     summary="生产抽奖订单",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
     *                 @OA\Property(property="coin_goods_title", type="string",description="商品标题"),
     *                 @OA\Property(property="coin_goods_img", type="string",description="商品图片"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "coin_goods_title": "键盘",
     *                      "coin_goods_img": "http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function add_cj_order(){
        $data = $this->request->param();
        $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
//        dump($user_info);
//        return;
        $data['order_id'] = md5(time());//订单号
        $data['order_user_id'] = $user_info['id'];//下单用户id
        $data['order_user_name'] = $user_info['name'];//下单用户姓名
        $data['order_user_photo'] = $user_info['avatar'];//下单用户头像
        $data['coin_goods_id'] = 0;//下单商品id
        $data['order_type'] = 2;//订单类型
        $data['order_statu'] = 3;//订单状态
//        dump($data);
//        return;
        $save = Db::table('ul_coin_order')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'成功']);
        }else{
            return json(['code'=>0,'msg'=>'失败']);
        }

    }

    /**
     * @OA\Post(
     *     path="/cq/goods/order_list",
     *     tags={"金币商城"},
     *     summary="当前用户订单列表-分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
     *                 @OA\Property(property="pageNum", type="int",description=""),
     *                 @OA\Property(property="pageSize", type="int",description=""),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function order_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $open_id = $this->request->param('open_id');
        $list = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->page($page, $count)
            ->order('order_time desc')
            ->select();
        $limit = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->count();
        $limits = ceil($limit/$count);
        return json(['code'=>200,'msg'=>'订单列表','data'=>$list,'limit'=>$limits,'count'=>$limit]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/yxd_order_list",
     *     tags={"金币商城"},
     *     summary="当前用户订单列表-不分页",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function yxd_order_list(){
        $open_id = $this->request->param('open_id');
        $list = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->where('order_statu',0)
            ->order('order_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'订单列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/dfh_order_list",
     *     tags={"金币商城"},
     *     summary="待发货列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function dfh_order_list(){
        $open_id = $this->request->param('open_id');
//        $id = $this->request->param('id');
        $list = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->where('order_statu',1)
            ->order('order_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'订单列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/yfh_order_list",
     *     tags={"金币商城"},
     *     summary="已发货列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function yfh_order_list(){
        $open_id = $this->request->param('open_id');
//        $id = $this->request->param('id');
        $list = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->where('order_statu',2)
            ->order('order_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'订单列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/dbc_order_list",
     *     tags={"金币商城"},
     *     summary="待补充收货信息列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="open_id", type="string",description="用户OPEN_ID"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function dbc_order_list(){
        $open_id = $this->request->param('open_id');
//        $id = $this->request->param('id');
        $list = Db::table('ul_coin_order')
            ->where('open_id',$open_id)
            ->where('order_statu',3)
            ->order('order_time desc')
            ->select();
        return json(['code'=>200,'msg'=>'订单列表','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/order_info",
     *     tags={"金币商城"},
     *     summary="获取订单详情",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id", type="int",description="id"),
     *                 example={
     *                      "id": "33",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function order_info($id){
        $list = Db::table('ul_coin_order')->find($id);
        return json(['code'=>200,'msg'=>'订单信息','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/delete_order",
     *     tags={"金币商城"},
     *     summary="删除订单",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id", type="int",description="id"),
     *                 example={
     *                      "id": "33",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
    public function delete_order($id){
        $de = Db::table('ul_coin_order')->where('id',$id)->delete();
        if($de){
            return json(['code'=>200,'msg'=>'成功']);
        }else{
            return json(['code'=>0,'msg'=>'失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/goods/update_order",
     *     tags={"金币商城"},
     *     summary="修改订单信息",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id", type="int",description="id"),
     *                 example={
     *                      "id": "33",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_coin_order"),
     *             },
     *         )
     *     )
     * )
     */
        public function update_order()
        {
            $data = $this->request->param();
            $save = Db::table('ul_coin_order')->where('id', $data['id'])->update($data);
            if ($save) {
                return json(['code' => 200, 'msg' => '成功']);
            } else {
                return json(['code' => 0, 'msg' => '失败']);
            }
        }


}