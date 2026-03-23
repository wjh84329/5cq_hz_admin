<?php

namespace app\cq\controller;

use app\BaseController;
use think\facade\Db;

class Shequ extends BaseController
{
    /**
     * @OA\Post(
     *     path="/cq/shequ/fl_list",
     *     tags={"社区管理"},
     *     summary="获取社区分类列表",
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
     *                 @OA\Schema(ref="#/components/schemas/sq_fl"),
     *             },
     *         )
     *     )
     * )
     */
    public function fl_list(){
        $list = Db::table('sq_fl')->where('title_id',0)->select()->toArray();
        foreach ($list as $k => $v){
            $list[$k]['fl2'] = Db::table('sq_fl')->where('title_id',$v['id'])->select()->toArray();
            foreach ($list[$k]['fl2'] as $k1 => $v1){
                $list[$k]['fl2'][$k1]['count'] = Db::table('fbtz')->where('fl_id',$v1['id'])->count();
//                dump($v1);
            }
        }
//        dump($list);
        return json(['code'=>200,'msg'=>'社区首页分类信息','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/shequ/bt",
     *     tags={"社区管理"},
     *     summary="获取标题内容",
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
     *                 @OA\Schema(ref="#/components/schemas/sq_fl"),
     *             },
     *         )
     *     )
     * )
     */
    public function bt($id){
        $info = Db::table('sq_fl')->where('id',$id)->find();
        return json(['code'=>200,'msg'=>'获取标题内容','data'=>$info]);
    }

    /**
     * @OA\Post(
     *     path="/cq/shequ/tz_list",
     *     tags={"社区管理"},
     *     summary="获取帖子列表",
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
     *                 @OA\Schema(ref="#/components/schemas/fbtz"),
     *             },
     *         )
     *     )
     * )
     */
    public function tz_list(){
        $t_id = $this->request->param('id');
        $list = Db::table('fbtz')->where('fl_id',$t_id)->where('is_sh',1)->select()->toArray();
        foreach ($list as $k => $v){
            $list[$k]['user'] = Db::table('ul_order_user')->where('open_id',$v['open_id'])->find();
        }
        return json(['code'=>200,'msg'=>'帖子列表','data'=>$list]);;
    }
}