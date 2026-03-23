<?php


namespace app\admin\controller\business;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use app\Request;
use think\App;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Sbk extends AdminController
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
            $count = Db::table('ul_sbk')->count();
            $list = Db::table('ul_sbk')
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

    public function edit($id)
    {
        $list = Db::table('ul_sbk')->find($id);
        if ($this->request->isPost()) {
            $data['support_name']= $this->request->param('support_name');
            $data['support_logo']= $this->request->param('support_logo');
            $data['support_link']= $this->request->param('support_link');
            $data['matic_data']= $this->request->param('matic_data');
            $data['matic_price']= $this->request->param('matic_price');
            $data['broadcast_link']= $this->request->param('broadcast_link');
            $data['broadcast_statu']= $this->request->param('broadcast_statu');
            $data['red_num']= $this->request->param('red_num');
            $data['blue_num']= $this->request->param('blue_num');
            $data['shenhao_money']= $this->request->param('shenhao_money');
            $data['shenhao_price']= $this->request->param('shenhao_price');
            $data['shenhao_user_name']= $this->request->param('shenhao_user_name');
            $data['pk_money']= $this->request->param('pk_money');
            $data['pk_kill']= $this->request->param('pk_kill');
            $data['pk_user_name']= $this->request->param('pk_user_name');
            $data['king_money']= $this->request->param('king_money');
            $data['king_num']= $this->request->param('king_num');
            $data['king_user_name']= $this->request->param('king_user_name');
            $data['rank_statu']= $this->request->param('rank_statu');
            $data['match_statu']= $this->request->param('match_statu');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_sbk')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }

    public function add(){
        if ($this->request->isPost()) {
            $data['support_name']= $this->request->param('support_name');
            $data['support_logo']= $this->request->param('support_logo');
            $data['support_link']= $this->request->param('support_link');
            $data['matic_data']= $this->request->param('matic_data');
            $data['matic_price']= $this->request->param('matic_price');
            $data['broadcast_link']= $this->request->param('broadcast_link');
            $data['broadcast_statu']= $this->request->param('broadcast_statu');
            $data['red_num']= $this->request->param('red_num');
            $data['blue_num']= $this->request->param('blue_num');
            $data['shenhao_money']= $this->request->param('shenhao_money');
            $data['shenhao_price']= $this->request->param('shenhao_price');
            $data['shenhao_user_name']= $this->request->param('shenhao_user_name');
            $data['pk_money']= $this->request->param('pk_money');
            $data['pk_kill']= $this->request->param('pk_kill');
            $data['pk_user_name']= $this->request->param('pk_user_name');
            $data['king_money']= $this->request->param('king_money');
            $data['king_num']= $this->request->param('king_num');
            $data['king_user_name']= $this->request->param('king_user_name');
            $data['rank_statu']= $this->request->param('rank_statu');
            $data['match_statu']= $this->request->param('match_statu');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_sbk')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }

    public function delete($id){
        if(Db::table('ul_sbk')->delete($id)){
            $sbk_id = $id;
            Db::table('jhm')->where('sbk_id',$sbk_id)->delete();
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
    public function stock($id){
        $list = Db::table('ul_sbk')->find($id);
        if ($this->request->isPost()) {
            $data = $this->request->param();
            if(Db::table('ul_sbk')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'成功']);
            }else{
                return json(['code'=>0,'msg'=>'失败']);
            }
        }
        return $this->fetch('stock',['list'=>$list]);
    }

    public function add_km(){
        $data['sbk_id'] = $this->request->param('id');
        for ($j=0;$j<500;$j++){
            $data['jhm'] = $this->random_str(20);
            Db::table('jhm')->insert($data);
        }
        $this->success('成功');
    }

    /*
     * 生成随机字符串
     * */
    public function random_str($length)
    {
//生成一个包含 大写英文字母, 小写英文字母, 数字 的数组
        $arr = array_merge(range(0, 9), range('a', 'z'), range('A', 'Z'));
        $str = '';
        $arr_len = count($arr);
        for ($i = 0; $i < $length; $i++)
        {
            $rand = mt_rand(0, $arr_len-1);
            $str.=$arr[$rand];
        }
        return $str;
    }

}
