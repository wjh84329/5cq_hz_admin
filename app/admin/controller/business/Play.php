<?php


namespace app\admin\controller\business;


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
class Play extends AdminController
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
            $tol=($page-1)*$limit+1;
            $count = Db::table('ul_play')->count();
            $list = Db::table('ul_play')
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
        $list = Db::table('ul_play')->find($id);
        if ($this->request->isPost()) {
            $data['title']= $this->request->param('title');
            $data['info']= $this->request->param('info');
            $data['play_img']= $this->request->param('play_img');
            $data['play_link']= $this->request->param('play_link');
            $data['banner_statu']= $this->request->param('banner_statu');
            $data['play_statu']= $this->request->param('play_statu');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_play')->where('id',$id)->update($data)){
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
            $data['info']= $this->request->param('info');
            $data['play_img']= $this->request->param('play_img');
            $data['play_link']= $this->request->param('play_link');
            $data['banner_statu']= $this->request->param('banner_statu');
            $data['play_statu']= $this->request->param('play_statu');
//            $data['smsCode']= $this->request->param('smsCode');
            if(Db::table('ul_play')->insert($data)){
                return json(['code'=>1,'msg'=>'添加成功']);
            }else{
                return json(['code'=>0,'msg'=>'添加失败']);
            }
        }
        return $this->fetch();
    }

    public function delete($id){
        if(Db::table('ul_play')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }
}
