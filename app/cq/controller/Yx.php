<?php

namespace app\cq\controller;

use app\BaseController;
use think\facade\Db;
use DateTime;
use DateInterval;

class Yx extends BaseController
{
    /**
     * @OA\Post(
     *     path="/cq/yx/rm_yx_list",
     *     tags={"游戏管理"},
     *     summary="热门游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="pageNum", type="string",description="游戏分类"),
     *                 @OA\Property(property="pageSize", type="string",description="游戏分类"),
     *                 @OA\Property(property="zylx", type="string",description="游戏分类"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function rm_yx_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $list = Db::table('ul_yxlb')
            ->where('is_rm',0)
            ->where('is_ts',1)
            ->page($page, $count)
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'热门','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/tj_yx_list",
     *     tags={"游戏管理"},
     *     summary="推荐游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="pageNum", type="string",description="游戏分类"),
     *                 @OA\Property(property="pageSize", type="string",description="游戏分类"),
     *                 @OA\Property(property="zylx", type="string",description="游戏分类"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function tj_yx_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $list = Db::table('ul_yxlb')
            ->where('is_tj',0)
            ->where('is_ts',1)
            ->page($page, $count)
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'推荐','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/szy_yx_list",
     *     tags={"游戏管理"},
     *     summary="三职业游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="pageNum", type="string",description="游戏分类"),
     *                 @OA\Property(property="pageSize", type="string",description="游戏分类"),
     *                 @OA\Property(property="zylx", type="string",description="游戏分类"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function szy_yx_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $list = Db::table('ul_yxlb')
            ->where('zylx','三职业')
            ->where('is_ts',1)
            ->page($page, $count)
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'三职业','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/dzy_yx_list",
     *     tags={"游戏管理"},
     *     summary="单职业游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="pageNum", type="string",description="游戏分类"),
     *                 @OA\Property(property="pageSize", type="string",description="游戏分类"),
     *                 @OA\Property(property="zylx", type="string",description="游戏分类"),
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
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function dzy_yx_list(){
        $page = $this->request->param('pageNum');
        $count = $this->request->param('pageSize');
        $list = Db::table('ul_yxlb')
            ->where('zylx','单职业')
            ->where('is_ts',1)
            ->page($page, $count)
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'单职业','list'=>$list]);

    }

    /**
     * @OA\Post(path="/cq/yx/yx_list",
     *   tags={"游戏管理"},
     *   summary="所有游戏列表",
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
    public function yx_list(){
        $list = Db::table('ul_yxlb')
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'游戏列表','list'=>$list]);
    }

    /**
     * @OA\Post(path="/cq/yx/yx_fl_list",
     *   tags={"游戏管理"},
     *   summary="所有游戏分类列表",
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/yxfl"),
     *             },
     *         )
     *     )
     * )
     */
    public function yx_fl_list(){
        $list = Db::table('yxfl')->select();
        return json(['code'=>200,'msg'=>'游戏分类列表','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/get_yxlist",
     *     tags={"游戏管理"},
     *     summary="根据分类获取游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="zylx", type="string",description="游戏分类"),
     *                 example={
     *                      "zylx": "单职业",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_yxlist(){
        $data = $this->request->param();
        $list = Db::table('ul_yxlb')
            ->where('zylx',$data['zylx'])
            ->order('create_time desc')
            ->select()->toArray();
        return json(['code'=>200,'msg'=>'游戏列表','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/get_name_yxlb",
     *     tags={"游戏管理"},
     *     summary="根据游戏名称获取游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="yx_name", type="string",description="游戏名称"),
     *                 example={
     *                      "yx_name": "2",
     *                 }
     *             )
     *         )
     *     ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/ul_yxlb"),
     *             },
     *         )
     *     )
     * )
     */
    public function get_name_yxlb(){
        $data = $this->request->param();
        $list = Db::table("ul_yxlb")->where('yx_name','like',$data['yx_name'])->select();
        return json(['code'=>200,'msg'=>'游戏列表','list'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/yyxq",
     *     tags={"游戏管理"},
     *     summary="特色好服游戏详情",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property(property="id",type="int",description="游戏ID"),
     *                 @OA\Property(property="open_id",type="string",description="open_id"),
     *                 example={
     *                      "id": "1",
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
     *                 @OA\Schema(ref="#/components/schemas/yxlb"),
     *             },
     *         )
     *     )
     * )
     */

    public function yyxq(){
        $data = $this->request->param();
        $info = Db::table('ul_yxlb')->find($data['id']);
        $count = Db::table('yxpf')->where('yx_id',$data['id'])->where('open_id',$data['open_id'])->count();
        if($count==1){
            $info['is_pf']=1;//用户已评分
        }else{
            $info['is_pf']=0;//用户未评分
        }
        if(Db::table('yxpf')->where('yx_id',$data['id'])->count()==0){
            $info['pf']=$info['pf'];
        }else{
            $info['pf'] = round((Db::table('yxpf')->where('yx_id',$data['id'])->sum('soc')+$info['pf'])/(Db::table('yxpf')->where('yx_id',$data['id'])->count()+1),1);
        }
        $info['yxjt'] = explode('|',$info['yxjt']);
        $rw1 = Db::table('coin_info')->where('open_id',$data['open_id'])->where('yx_id',$data['id'])->where('title','任务一')->whereTime('updata_time','today')->count();
        if($rw1==0){
            $info['rw1']=0;//未领取
        }else{
            $info['rw1']=1;//已领取
        }
        $rw2 = Db::table('coin_info')->where('open_id',$data['open_id'])->where('yx_id',$data['id'])->where('title','任务二')->whereTime('updata_time','today')->count();
        if($rw2==0){
            $info['rw2']=0;//未领取
        }else{
            $info['rw2']=1;//已领取
        }
        $rw3 = Db::table('coin_info')->where('open_id',$data['open_id'])->where('yx_id',$data['id'])->where('title','任务三')->whereTime('updata_time','today')->count();
        if($rw3==0){
            $info['rw3']=0;//未领取
        }else{
            $info['rw3']=1;//已领取
        }
        //获取游戏时长
        $data_Info = Db::table('yxsc')->where('open_id',$data['open_id'])->whereTime('update_time','today')->where('yx_id',$data['id'])->find();
        $operation_info = operation_info();
        $info['renwu1'] = $operation_info['renwu1'];
        $info['renwu2'] = $operation_info['renwu2'];
        $info['renwu3'] = $operation_info['renwu3'];
        $info['user_name'] = $this->get_name();
        $info['hf_sc'] = isset($data_Info['hf_sc'])&&!empty($data_Info['hf_sc'])?$data_Info['hf_sc']:0;
        return json(['code'=>200,'msg'=>'游戏详情','list'=>$info]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/step_yyxq",
     *     tags={"游戏管理"},
     *     summary="设置游戏评分",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="yx_id",type="int",description="游戏ID"),
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
     *                 @OA\Property( property="soc",type="int",description="分值"),
     *                 example={
     *                      "yx_id": 1,
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "soc": 5,
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

    public function step_yyxq(){
        $data = $this->request->param();
        $inf0 = Db::table('yxpf')->where('open_id',$data['open_id'])->where('yx_id',$data['yx_id'])->count();
        if($inf0==0){
            $save = Db::table('yxpf')->insert($data);
            if($save){
                return json(['code'=>200,'msg'=>'成功','pf'=>round(Db::table('yxpf')->where('yx_id',$data['yx_id'])->sum('soc')/Db::table('yxpf')->where('yx_id',$data['yx_id'])->count(),1)]);
            }else{
                return json(['code'=>0,'msg'=>'失败']);
            }
        }else{
            return json(['code'=>1,'msg'=>'成功','pf'=>round(Db::table('yxpf')->where('yx_id',$data['yx_id'])->sum('soc')/Db::table('yxpf')->where('yx_id',$data['yx_id'])->count(),1)]);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/get_ts_list",
     *     tags={"游戏管理"},
     *     summary="获取特色好服列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="zylx",type="string",description="游戏分类"),
     *                 @OA\Property( property="yx_name",type="string",description="游戏名称"),
     *                 @OA\Property( property="px",type="string",description="排序"),
     *                 example={
     *                      "zylx": "",
     *                      "yx_name": "",
     *                      "px": "",
     *                 }
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

    public function get_ts_list(){
        $data = $this->request->param();
        if (array_key_exists('yx_name', $data)){
            $where['name'] = $data['yx_name'];
        }elseif (array_key_exists('zylx',$data)){
            $where['name'] = $data['zylx'];
        }
        $list = Db::table('ul_yxlb')
            /*->whereTime('startTime','<=',date('Y-m-d H:i:s'))
            ->whereTime('expiresTime','>=',date('Y-m-d H:i:s'))*/
            ->where('is_ts',0)
            ->where('is_zs',0)
            ->where(function ($query)use ($where){
                $query->where('yx_name', 'like', '%'.$where['name'].'%')
                    ->whereOr('zylx', 'like', '%'.$where['name'].'%')
                    ->whereOr('yxbb', 'like', '%'.$where['name'].'%')
                    ->whereOr('yxjj', 'like', '%'.$where['name'].'%');
                    // ->whereOr('xq', 'like', '%'.$where['name'].'%');
                    /*->whereOr('version', 'like', '%'.$where['name'].'%')
                    ->whereOr('homeUrl', 'like', '%'.$where['name'].'%');*/
            })
            ->order('create_time desc')
            ->select()->toArray();
//        if($data['zylx']==''){
//            if($data['px']=='热门'){
//                $list = Db::table('ul_yxlb')->where('yx_name','like','%'.$data['yx_name'].'%')->where('is_ts',0)->select()->toArray();
//                /*if(Db::table('yxpf')->where('yx_id',$data['id'])->count()==0){
//                    $info['pf']=$info['pf'];
//                }else{
//                    $info['pf'] = round((Db::table('yxpf')->where('yx_id',$data['id'])->sum('soc')+$info['pf'])/(Db::table('yxpf')->where('yx_id',$data['id'])->count()+1),1);
//                }*/
//                foreach ($list as $k =>$v){
//                    if(Db::table('yxpf')->where('yx_id',$v['id'])->count()==0){
//                    $list[$k]['pf']=$v['pf'];
//                    }else{
//                        $list[$k]['pf'] = round((Db::table('yxpf')->where('yx_id',$v['id'])->sum('soc')+$v['pf'])/(Db::table('yxpf')->where('yx_id',$v['id'])->count()+1),1);
//                    }
//                }
//                $edit = array_column($list,'pf');
//                array_multisort($edit,SORT_DESC,$list);
//            }elseif ($data['px']=='最新'){
//                $list = Db::table('ul_yxlb')->where('yx_name','like','%'.$data['yx_name'].'%')->where('is_ts',0)->order('create_time desc')->select()->toArray();
//            }else{
//                $list = Db::table('ul_yxlb')->where('yx_name','like','%'.$data['yx_name'].'%')->where('is_ts',0)->select()->toArray();
//            }
//        }else{
//            $list = Db::table('ul_yxlb')->where('yx_name','like','%'.$data['yx_name'].'%')->where('is_ts',0)->where('zylx',$data['zylx'])->select()->toArray();
//        }
        foreach ($list as $k =>$v){
            $list[$k]['yxjt']=explode('|',$v['yxjt']);
            $list[$k]['yxbq']=explode(',',$v['yxbq']);
            $list[$k]['time']='今日  '.date('H:s', roundTime(30, 'm'));;
            $list[$k]['uuid'] = md5($v['id']);
        }
        return json(['code'=>200,'msg'=>'特色好服游戏列表','list'=>$list]);
    }

    public function getShowList(){
        $list = Db::table("ul_yxlb")->where('is_ts',0)->where('is_tj',0)->select();
        return json(['code'=>200,'msg'=>'特色好服banner列表','list'=>$list]);
    }
    /**
     * @OA\Post(
     *     path="/cq/yx/wdyx_list",
     *     tags={"游戏管理"},
     *     summary="我的游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
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
     *                 @OA\Schema(ref="#/components/schemas/wdyx_list"),
     *             },
     *         )
     *     )
     * )
     */
    public function wdyx_list(){
        $data = $this->request->param();
//        $list = Db::table('wdyx_list')->where('open_id',$data['open_id'])->where('status',1)->order('add_time desc')->select();
        $list = Db::table('wdyx_list')->where('open_id',$data['open_id'])->order('add_time desc')->select();
        return json(['code'=>200,'msg'=>'我的游戏列表','list'=>$list]);
    }

    /*
     * 获取游戏总数
     * */
    public function wdyx_count(){
        $data = $this->request->param();
        /*$count = Db::table('wdyx_list')->where('open_id',$data['open_id'])->count();
        return json(['code'=>1,'count'=>$count]);*/
        $aa = Db::table('wdyx_list')->where('open_id', $data['open_id'])->count();
//        return json($aa);
        if($aa==0){
            return json(['code'=>0,'msg'=>'无游戏']);
        }else{
            $bb = Db::table('yxxz_yz')->where('open_id', $data['open_id'])->find();
            $wdyx_id = $bb['wdyx_id'];
            $info = Db::table('wdyx_list')->where('id',$wdyx_id)->find();
            if($info['status']==100){
                return json(['code'=>1,'msg'=>'已下载']);
            }else{
                return json(['code'=>2,'msg'=>'未下载']);
            }
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/add_wdyx",
     *     tags={"游戏管理"},
     *     summary="添加我的游戏",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
     *                 @OA\Property( property="name",type="string",description="游戏名称"),
     *                 @OA\Property( property="gid",type="string",description="gameid"),
     *                 @OA\Property( property="url",type="string",description="游戏官网"),
     *                 @OA\Property( property="ys_login_name",type="string",description="登陆器压缩名"),
     *                 @OA\Property( property="login_name",type="string",description="登陆器名"),
     *                 example={
     *                      "open_id": "ociWS6mqBH6uevoMMi6FfBiBCZCE",
     *                      "name": "传奇",
     *                      "gid": "1723279223240",
     *                      "url": "www.baidu.com",
     *                      "ys_login_name": "登陆器压缩名",
     *                      "login_name": "登陆器名",
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
    public function add_wdyx(){
        $data = $this->request->param();
        $file_list = scandirFolder('./icon/');
        $index = rand(0,count($file_list)-1);
        $count = Db::table('wdyx_list')->where('open_id', $data['open_id'])->where('url',$data['url'])->count();
        if($count==0){
            $data['icon'] = $file_list[$index];
            $save = Db::table('wdyx_list')->insert($data);
            if($save){
                $info = Db::table('wdyx_list')->where($data)->where('status',0)->order('id desc')->find();
//            session($info['open_id'],['wdyx_id'=>$info['id']]);
                $aa = Db::table('yxxz_yz')->where('open_id', $data['open_id'])->findOrEmpty();
                if(empty($aa)){
                    Db::table('yxxz_yz')->insert(['open_id'=>$data['open_id'],'wdyx_id'=>$info['id']]);
                }else{
                    Db::table('yxxz_yz')->where('open_id',$data['open_id'])->update(['wdyx_id'=>$info['id']]);
                }
                return json(['code'=>200,'msg'=>'添加成功','data'=>$info]);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }else{
//            Db::table('wdyx_list')->where('url',$data['url'])->delete();
            $count1 = Db::table('wdyx_list')->where('open_id', $data['open_id'])->where('url',$data['url'])->where('name',$data['name'])->count();
            if($count1==0){
                $save = Db::table('wdyx_list')->where('url',$data['url'])->update($data);
                if($save){
                    $info = Db::table('wdyx_list')->where('url',$data['url'])->order('id desc')->find();
                    return json(['code'=>200,'msg'=>'更新成功','data'=>$info]);
                }else{
                    return json(['code'=>0,'msg'=>'更新失败']);
                }
            }else{
                $info = Db::table('wdyx_list')->where('url',$data['url'])->where('name',$data['name'])->order('id desc')->find();
                return json(['code'=>1,'msg'=>'已存在','data'=>$info]);
            }

        }
    }

    
    /**
     * @OA\Post(
     *     path="/cq/yx/add_wdyx_over",
     *     tags={"游戏管理"},
     *     summary="下载完成接口",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="yx_id",type="int",description="open_id"),
     *                 example={
     *                      "yx_id": 1,
     *                      "status": 50,
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
    public function add_wdyx_over(){
        $data = $this->request->param();
        $save = Db::table('wdyx_list')->where('id',$data['yx_id'])->update(['status'=>$data['status']]);
        if($save){
            return json(['code'=>200,'msg'=>'下载完成']);
        }else{
            return json(['code'=>1,'msg'=>'下载失败']);
        }
    }
    
    public function update_wdyx_icon(){
        $data = $this->request->param();
        $save = Db::table('wdyx_list')->where('id',$data['yx_id'])->update(['icon'=>$data['icon']]);
        if($save){
            return json(['code'=>200,'msg'=>'更新成功']);
        }else{
            return json(['code'=>1,'msg'=>'更新失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/del_wdyx",
     *     tags={"游戏管理"},
     *     summary="删除我的游戏",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="id",type="string",description="游戏id"),
     *                 example={
     *                      "id": 1,
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
    public function del_wdyx($id){
        $list = Db::table('wdyx_list')->find($id);
        $del = Db::table('wdyx_list')->delete($id);
        if($del>0){
            return json(['code'=>200,'msg'=>'删除成功','data'=>$list]);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    /*
     * 获取当前点击游戏信息
     * */
    public function get_wdyx_info($id){
        $list = Db::table('wdyx_list')->find($id);
        return json(['code'=>200,'msg'=>'成功','data'=>$list]);
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/jcgx",
     *     tags={"游戏管理"},
     *     summary="盒子检测更新",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="version",type="string",description="version"),
     *                 example={
     *                      "version": "1.1.0",
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
    public function jcgx(){
        $data = $this->request->param();
        $system_config = Db::table('ul_system_config')->where('id',20)->find();
        $data['system_config'] = $system_config['value'];
        if($data['version']==$data['system_config']){
            return json(['code'=>1,'msg'=>'一致','data'=>$data]);
        }else{
            return json(['code'=>2,'msg'=>'不一致','data'=>$data]);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/add_look",
     *     tags={"游戏管理"},
     *     summary="添加游戏浏览记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="name",type="string",description="name"),
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
     *                 @OA\Property( property="url",type="string",description="url"),
     *                 example={
     *                      "name": "测试",
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "url": "http://www.baidu.com",
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
    public function add_look(){
        $data = $this->request->param();
        $info = Db::table('wdyx_look')
            ->where('name',$data['name'])
            ->where('url',$data['url'])
            ->where('open_id',$data['open_id'])
            ->count();
        if($info==0){
            $save = Db::table('wdyx_look')->insert($data);

        }else{
            $date = date('Y-m-d H:i:s', time());
//            return json($date);
            $save = Db::table('wdyx_look')
                ->where('name',$data['name'])
                ->where('url',$data['url'])
                ->where('open_id',$data['open_id'])
                ->update(['update_time'=>$date]);
        }
        if($save){
            $data_info = Db::table('wdyx_look')->where('name',$data['name'])->where('url',$data['url'])->order('id desc')->find();
            return json(['code'=>200,'msg'=>'添加成功','data'=>$data_info]);
        }else{
            return json(['code'=>0,'msg'=>'添加失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/wdyx_look",
     *     tags={"游戏管理"},
     *     summary="获取游戏浏览记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
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
    public function wdyx_look(){
        $data = $this->request->param();
        $list = Db::table('wdyx_look')->where('open_id',$data['open_id'])->order('update_time desc')->select();
        if($list){
            return json(['code'=>200,'msg'=>'获取成功','data'=>$list]);
        }else{
            return json(['code'=>0,'msg'=>'获取失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/del_wdyx_look",
     *     tags={"游戏管理"},
     *     summary="删除游戏浏览记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="open_id",type="string",description="open_id"),
     *                 @OA\Property( property="id",type="string",description="id"),
     *                 example={
     *                      "open_id": "ociWS6j17km6QToj5dcoy1kNB8YA",
     *                      "id": "1",
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
    public function del_wdyx_look(){
        $data = $this->request->param();
        $save = Db::table('wdyx_look')
            ->where('id',$data['id'])
            ->delete();
        if($save){
            return json(['code'=>200,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/add_hz_step",
     *     tags={"游戏管理"},
     *     summary="添加盒子安装记录",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="os",type="string",description="os"),
     *                 @OA\Property( property="ip",type="string",description="ip"),
     *                 @OA\Property( property="add_time",type="string",description="add_time"),
     *                 example={
     *                      "os": "centos7.8",
     *                      "ip": "192.168.1.1",
     *                      "add_time": "2022-02-23 12:19:00"
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
    public function add_hz_step(){
        $data = $this->request->param();
        if(!array_key_exists('ip',$data)){
            $data['ip'] = $this->request->ip();
        }
        $save = Db::table('hz_step')->insert($data);
        if($save){
            return json(['code'=>200,'msg'=>'添加成功']);
        }else{
            return json(['code'=>0,'msg'=>'添加失败']);
        }
    }

    /*
     * 获取设备是否安装过盒子
     *
     */
    public function get_hz_step($uuid){
//        $data = $this->request->param();
        $list = Db::table('hz_step')->where('uuid',$uuid)->findOrEmpty();
        if(!empty($list)){
            return json(false);
        }else{
            return json(true);
        }
    }

    /**
     * @OA\Post(
     *     path="/cq/yx/add_game",
     *     tags={"游戏管理"},
     *     summary="添加游戏列表",
     *     @OA\RequestBody(
     *         @OA\MediaType(
     *             mediaType="application/json",
     *             @OA\Schema(
     *                 @OA\Property( property="serverName",type="string",description="追龙●火龙单职业"),
     *                 @OA\Property( property="serverIp",type="string",description="产出不封顶●搬砖"),
     *                 @OA\Property( property="openTime",type="string",description="2024-07-24 全天套黄"),
     *                 @OA\Property( property="QQ",type="string",description="稳定搬砖养老"),
     *                 @OA\Property( property="route",type="string",description="长期服非快餐"),
     *                 @OA\Property( property="version",type="string",description="免费领赞助●无暗坑●材料货币满地●无线收"),
     *                 @OA\Property( property="homeUrl",type="string",description="http://103.8.222.71:1699/"),
     *                 @OA\Property( property="listUrl",type="string",description="http://103.8.222.71:1699/lb.txt"),
     *                 @OA\Property( property="engine",type="string",description="GOM"),
     *                 @OA\Property( property="site",type="string",description="5cq"),
     *                 example={
     *                      "serverName":"追龙●火龙单职业",
     *                      "serverIp":"产出不封顶●搬砖",
     *                      "openTime":"2024-07-24 全天套黄",
     *                      "QQ":"稳定搬砖养老",
     *                      "route":"长期服非快餐",
     *                      "version":"免费领赞助●无暗坑●材料货币满地●无线收",
     *                      "homeUrl":"http://103.8.222.71:1699/",
     *                      "listUrl":"http://103.8.222.71:1699/lb.txt",
     *                      "engine":"GOM",
     *                      "site":"5cq",
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
    public function add_game(){
        $data = $this->request->param();
        $id = Db::table('xftj')->insertGetId($data);
        if($id){
            return json(['code'=>200,'msg'=>'添加成功','id'=>$id]);
        }else{
            return json(['code'=>0,'msg'=>'添加失败']);
        }
    }
    
    public function updateState($id){
        $data = $this->request->param();
        $info = Db::table('xftj')->find($id);
        if($info['state']==3 && $data['state']==0){
            // 假设的时间a
            $timeA = new DateTime($info['createTime']);

            // 获取当前时间b
            $timeB = new DateTime();

            // 假设的时间c
            $timeC = new DateTime($info['expiresTime']);

            // 计算时间a与时间b之间的差异
            $interval = $timeA->diff($timeB);

            // 将差值加到时间c上
            $timeC->add($interval);

            $data['expiresTime'] = $timeC->format('Y-m-d H:i:s');

        }
        if($data['state']==3){
            $data['createTime'] = date('Y-m-d H:i:s');
        }
        $save = Db::table('xftj')->where('id',$id)->update($data);
        if($save){
            if($info['state']==2 && $data['state']==0){
                Db::table('ul_system_admin')->where('username',$info['addUser'])->inc('money',$info['cmoney'])->update();
            }
            return json(['code'=>200,'msg'=>'更新成功']);
        }else{
            return json(['code'=>0,'msg'=>'更新失败']);
        }
    }

    public function updateGame($id){
        $data = $this->request->param();
        $save = Db::table('xftj')->where('id',$id)->update($data);
        if($save){
            return json(['code'=>200,'msg'=>'更新成功']);
        }else{
            return json(['code'=>0,'msg'=>'更新失败']);
        }
    }

    public function deleteGame($id){
        $save = Db::table('xftj')->where('id',$id)->delete();
        if($save){
            return json(['code'=>200,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
    /**
     * @OA\Post(path="/cq/yx/getGameList",
     *   tags={"游戏管理"},
     *   summary="获取游戏列表",
     *          @OA\RequestBody(
     *          @OA\MediaType(
     *              mediaType="application/json",
     *              @OA\Schema(
     *                  @OA\Property( property="open_id",type="string",description="openid"),
     *                  example={
     *                        "open_id":"oWpvM6VWrGoKKWps7aj-fD9YkneA",
     *                   }
     *              )
     *          )
     *      ),
     * @OA\Response(
     *         response=200,
     *         description="OK",
     *         @OA\JsonContent(
     *             oneOf={
     *                 @OA\Schema(ref="#/components/schemas/xftj"),
     *             },
     *         )
     *     )
     * )
     */
    public function getGameList()
    {
        $data = $this->request->param();

        $page = max(1, (int)$this->request->param('pageNum', 1));
        $count = max(1, min(100, (int)$this->request->param('pageSize', 20)));

        if (array_key_exists('name', $data)) {
            $where['name'] = trim((string)$data['name']);
        } else {
            $where['name'] = '';
        }

        $openId = isset($data['open_id']) ? (string)$data['open_id'] : '';

        $data1 = Db::table('xftj')
            ->where('show', 1)
            ->whereTime('startTime', '<=', date('Y-m-d H:i:s'))
            ->whereTime('expiresTime', '>=', date('Y-m-d H:i:s'))
            ->where('state', 0)
            ->where(function ($query) use ($where) {
                $query->where('serverName', 'like', '%' . $where['name'] . '%')
                    ->whereOr('serverIp', 'like', '%' . $where['name'] . '%')
                    ->whereOr('openTime', 'like', '%' . $where['name'] . '%')
                    ->whereOr('QQ', 'like', '%' . $where['name'] . '%')
                    ->whereOr('route', 'like', '%' . $where['name'] . '%')
                    ->whereOr('version', 'like', '%' . $where['name'] . '%')
                    ->whereOr('homeUrl', 'like', '%' . $where['name'] . '%');
            })
            ->select()
            ->toArray();

        shuffle($data1);
        $list1 = $this->morelist($data1);

        $data2 = Db::table('xftj')
            ->where('show', 0)
            ->whereTime('startTime', '<=', date('Y-m-d H:i:s'))
            ->whereTime('expiresTime', '>=', date('Y-m-d H:i:s'))
            ->where('state', 0)
            ->where(function ($query) use ($where) {
                $query->where('serverName', 'like', '%' . $where['name'] . '%')
                    ->whereOr('serverIp', 'like', '%' . $where['name'] . '%')
                    ->whereOr('openTime', 'like', '%' . $where['name'] . '%')
                    ->whereOr('QQ', 'like', '%' . $where['name'] . '%')
                    ->whereOr('route', 'like', '%' . $where['name'] . '%')
                    ->whereOr('version', 'like', '%' . $where['name'] . '%')
                    ->whereOr('homeUrl', 'like', '%' . $where['name'] . '%');
            })
            ->select()
            ->toArray();

        shuffle($data2);
        $list2 = $this->morelist($data2);

        $list = array_merge($list1, $list2);

        $total = count($list);
        $lastPage = $total > 0 ? (int)ceil($total / $count) : 1;
        $offset = ($page - 1) * $count;
        $pageList = array_slice($list, $offset, $count);

        foreach ($pageList as &$item) {
            if ($openId !== '') {
                $item['collect'] = Db::table('collect')
                    ->where('open_id', $openId)
                    ->where('sID', $item['id'])
                    ->findOrEmpty() ? 1 : 2;
            } else {
                $item['collect'] = 2;
            }

            $item['homeUrl'] = 'https://www.5cq.com/go.html?u=' . $item['homeUrl'];
        }
        unset($item);

        return json([
            'code' => 200,
            'msg' => '游戏列表',
            'data' => $pageList,
            'page' => $page,
            'count' => $count,
            'total' => $total,
            'last_page' => $lastPage,
        ]);
    }
    //打乱顺序重新排序
    public function ssssss($data){
        $groupedData = [];

        // 遍历查询结果并进行分组
        foreach ($data as $item) {
            // 使用servername作为键
            $servername = $item['serverName'];

            // 如果这个servername在分组数组中还不存在，则初始化一个新的数组
            if (!isset($groupedData[$servername])) {
                $groupedData[$servername] = [];
            }

            // 将当前数据添加到对应servername的数组中
            $groupedData[$servername][] = $item;
        }
        shuffle($groupedData);
        $flattenedArray = [];
        foreach ($groupedData as $group){
            foreach ($group as $item) {
                $flattenedArray[] = $item;
            }
        }
        return $flattenedArray;
    }
    //生成多条数据
    public function morelist($products){
        $finalProducts = [];

        foreach ($products as $product) {
            // 根据num字段的值来决定复制记录的次数
            for ($i = 0; $i < $product['num']; $i++) {
                $finalProducts[] = $product;
                $finalProducts[$i]['uuid'] = md5($product['num'].$i);
            }
        }
        return $finalProducts;
    }
    
    /*
     *
     * */
    public function zjcs($id){
        $save = Db::table('ul_yxlb')->where('id',$id)->inc('xzcs',1)->update();
        if($save){
            $info = Db::table('ul_yxlb')->find($id);
            return json(['code'=>200,'msg'=>'游戏列表','list'=>$info]);
        }
    }
    public function setMyGame($id){
        $data = $this->request->param();
        $save = Db::table('wdyx_list')->where('id',$id)->update($data);
        if($save){
            return json(['code'=>200,'msg'=>'修改成功']);
        }else{
            return json(['code'=>0,'msg'=>'修改失败']);
        }
    }
    /*
     * 测试分页
     * */
    public function fy(){
        // 页码
        $page = 1;
// 每页数据条数
        $count = 2;
        $list = Db::table('ul_yxlb')
            ->where('is_rm',0)
            ->page($page, $count)
            ->order('create_time desc')
            ->select()->toArray();
        return json($list);
    }

    /*
     * 获取文本内随机名字传输给前端
     * */
    public function get_name(){
        $file = './AllName.txt';
        if(file_exists($file)){
            $content = file_get_contents($file);//文件内容读入字符串
            if(empty($content)){
                echo '文件内容为空';
            }else{
                $content = mb_convert_encoding($content,'UTF-8','ASCII,UTF-8,GB2312,GBK');//转换字符编码为utf-8
                $array = explode("\r\n",$content);//转换成数组
                $array = array_filter($array);//去空
                $array = array_unique($array);//去重
                $key = rand(0,count($array));
//                echo $key;
                return $array[$key];
            }
        }else{
            echo '文件不存在';
        }
    }
    public function ttt(){
        $list = Db::connect('localhost')->table('jax_publish')->select();
        Db::connect('mysql')->table('xftj')->where('site','1pk')->delete();
        foreach ($list as $key => $value){
            $data['site'] = '1pk';
            $data['serverName'] = $value['name'];
            $data['serverIp'] = $value['ipname'];
            $data['openTime'] = $value['datetime'];
            $data['QQ'] = $value['kfqq'];
            $data['route'] = $value['line'];
            $data['version'] = $value['versiondepict'];
            $data['homeUrl'] = $value['url'];
            $data['startTime'] = $value['startdate'];
            $data['expiresTime'] = $value['enddate'];
            $data['days'] = $value['days'];
            $data['num'] = $value['nums'];
            Db::connect('mysql')->table('xftj')->insert($data);
//            dump($data);
        }
    }
}