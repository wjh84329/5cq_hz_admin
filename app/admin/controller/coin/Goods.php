<?php


namespace app\admin\controller\coin;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Goods extends AdminController
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
            $limit = $this->request->param('limit');
            $tol=($page-1)*$limit+1;
            $count = Db::table('ul_coin_goods')->count();
            $list = Db::table('ul_coin_goods')
                ->page($page, $limit)
                ->order($this->sort)
                ->order('sort desc')
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
     * @NodeAnotation(title="入库")
     */
    public function stock($id)
    {
        $list = Db::table('ul_coin_goods')->find($id);
        if ($this->request->isPost()) {
            $data['num']= $this->request->param('num')+$this->request->param('number');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_coin_goods')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('stock',['list'=>$list]);
    }

    public function read($id)
    {
        $list = Db::table('ul_coin_goods')->find($id);
        return $this->fetch('read',['list'=>$list]);
    }

    public function edit($id)
    {
        $list = Db::table('ul_coin_goods')->find($id);
        if ($this->request->isPost()) {
            $data['title']= $this->request->param('title');
            $data['img']= $this->request->param('img');
            $data['price']= $this->request->param('price');
            $data['num']= $this->request->param('num');
            $data['sold']= $this->request->param('sold');
            $data['sort']= $this->request->param('sort');
            $data['type']= $this->request->param('type');
            $data['show']= $this->request->param('show');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_coin_goods')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('edit',['list'=>$list]);
    }

    public function add(){
        if ($this->request->isPost()) {
            $data['title']= $this->request->param('title');
            $data['img']= $this->request->param('img');
            $data['price']= $this->request->param('price');
            $data['num']= $this->request->param('num');
            $data['sold']= $this->request->param('sold');
            $data['sort']= $this->request->param('sort');
            $data['type']= $this->request->param('type');
            $data['show']= $this->request->param('show');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_coin_goods')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }

    public function delete($id){
        if(Db::table('ul_coin_goods')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
}
