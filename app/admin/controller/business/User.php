<?php


namespace app\admin\controller\business;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\service\GatewayPush;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class User extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            if($this->request->param('filter') !='{}'){
                //return json($this->request->param('filter'));
                $where = json_decode(html_entity_decode($this->request->param('filter'), ENT_QUOTES, 'UTF-8'), true);
                //return $where;
                $count = Db::table('ul_order_user')->where($where)->count();
                $list = Db::table('ul_order_user')
                    ->where($where)
                    ->order($this->sort)
                    ->page($page, $limit)
                    ->select();
            }else{
                $count = Db::table('ul_order_user')->count();
                $list = Db::table('ul_order_user')
                    //->where($where)
                    ->order($this->sort)
                    ->page($page, $limit)
                    ->select();
            }
            //return json($this->request->param('filter'));
            //$where = $this->request->param('filter');
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


    public function delete($id){
        if(Db::table('ul_order_user')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function modify($id){
        $data = $this->request->param();
        $save = Db::table('ul_order_user')->where('id',$id)->update([$data['field']=>$data['value']]);
        if($save !== false){
            $this->pushUserInfoUpdateById($id);
            $this->success('保存成功');
        }

        $this->error('保存失败');
    }

    public function edit($id){
        $list = Db::table('ul_order_user')->find($id);
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            if($data['is_sh']==0){
                return json(['code'=>0,'msg'=>'审核后才能提交']);
            }else{
                if($data['is_sh']==1){
                    $save = Db::table('ul_order_user')->where('id',$id)->update(['nickname'=>$data['name'],'avatar'=>$data['avatar2'],'is_sh'=>1]);
                }else{
                    $save = Db::table('ul_order_user')->where('id',$id)->update(['nickname'=>$data['name'],'avatar'=>$data['avatar2'],'is_sh'=>2]);
                }
                if($save){
                    $this->pushUserInfoUpdateById($id);
                    return json(['code'=>1,'msg'=>'审核成功']);
                }else{
                    return json(['code'=>0,'msg'=>'审核失败']);
                }
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }
    public function look($id)
    {

//        $czinfo = Db::table('yxcz')->find($id);//充值信息
        $userinfo = Db::table('ul_order_user')
            ->where('id',$id)->findOrEmpty();//用户信息
        $coinAddList = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('code',0)->count();//金币列表增加总条数
        $coinAddTotal = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('code',0)->sum('coin_num');//金币列表增加总和
        $coinDecList = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('code',1)->count();//金币列表减少总条数
        $coinDecTotal = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('code',1)->sum('coin_num');//金币列表减少总和
        $coinCzCount = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('title','金币兑换余额')->count();//金币充值总条数
        $coinCzTotal = Db::table('moneyInfo')
            ->where('open_id',$userinfo['open_id'])->where('code',0)->sum('money');//金币充值总数
        $coinCzCoin = Db::table('coin_info')
            ->where('open_id',$userinfo['open_id'])->where('title','金币兑换余额')->sum('coin_num');//金币充值累计消耗
        $Czcount = Db::table('yxcz')
            ->where('open_id',$userinfo['open_id'])->count();//累计充值次数
        $CzCgCount = Db::table('yxcz')
            ->where('open_id',$userinfo['open_id'])->where('is_cz',1)->count();//累计充值成功次数
        $CzCgMoney = Db::table('yxcz')
            ->where('open_id',$userinfo['open_id'])->where('is_cz',1)->sum('czje');//累计充值成功金额
        return $this->fetch('look',[
            'czinfo'=>$userinfo,'userinfo'=>$userinfo,'coinAddList'=>$coinAddList,'coinAddTotal'=>$coinAddTotal,
            'coinDecList'=>$coinDecList,'coinDecTotal'=>$coinDecTotal,'coinCzCount'=>$coinCzCount,
            'coinCzTotal'=>$coinCzTotal,'coinCzCoin'=>$coinCzCoin,'Czcount'=>$Czcount,'CzCgCount'=>$CzCgCount,'CzCgMoney'=>$CzCgMoney
        ]);
    }

    protected function pushUserInfoUpdateById($id)
    {
        $openId = Db::table('ul_order_user')->where('id', $id)->value('open_id');
        if (!empty($openId)) {
            GatewayPush::sendUserInfoUpdate($openId);
        }
    }
}
