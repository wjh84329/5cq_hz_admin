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
class Shipin extends AdminController
{
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $tol=($page-1)*$limit+1;
            $count = Db::table('fbsp')->count();
            $list = Db::table('fbsp')
                ->page($page, $limit)
                ->order($this->sort)
                ->order('add_time desc')
                ->select()->toArray();
            foreach ($list as $k => $v){
                $file_list = Db::table('ul_system_uploadfile')->where('id',$v['file_id'])->find();
                $list[$k]['url'] = $file_list['url'];
                $list[$k]['mime_type'] = $file_list['mime_type'];
            }
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
        $list = Db::table('fbsp')->find($id);
        if ($this->request->isPost()) {
            $data= $this->request->param();
            if(Db::table('fbsp')->where('id',$id)->update($data)){
                return json(['code'=>1,'msg'=>'修改成功']);
            }else{
                return json(['code'=>0,'msg'=>'修改失败']);
            }
        }
        return $this->fetch('stock',['list'=>$list]);
    }


    public function delete($id){
        if(Db::table('fbsp')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
    }

    public function info($id){
        $info = Db::table('fbsp')->find($id);
        $list = Db::table('ul_system_uploadfile')->where('id',$info['file_id'])->find();
        return $this->fetch('info',['list'=>$list]);
    }
}
