<?php


namespace app\admin\controller\business;


use app\admin\model\CoinGoods;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use think\App;
use think\facade\Db;

/**
 * Class Goods
 * @package app\admin\controller\mall
 * @ControllerAnnotation(title="商城商品管理")
 */
class Km extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = $this->request->param('page');
            $limit = $this->request->param('limit');
            $id = $this->request->param('id');
            $count = Db::table('jhm')->where('sbk_id',$id)->count();
            $list = Db::table('jhm')
                ->where('sbk_id',$id)
                ->order($this->sort)
                ->page($page, $limit)
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
     * @NodeAnotation(title="导出")
     */
    public function export()
    {
//        list($page, $limit, $where) = $this->buildTableParames();

        /*$id = $this->request->param('id');
        $this->model = Db::table('jhm')->where('sbk_id',$id);

        $fields = $this->request->param('fields', '{}', null);
        $image_fields = $this->request->param('image_fields', '{}', null);
        $select_fields = $this->request->param('select_fields', '{}', null);
        $date_fields = $this->request->param('date_fields', '{}', null);

        $fields = json_decode($fields, true);
        $image_fields = json_decode($image_fields, true);
        $select_fields = json_decode($select_fields, true);
        $date_fields = json_decode($date_fields, true);*/

//        $content = \app\common\tools\ExportTools::excel($this->model, '',$fields, $image_fields, $select_fields, $date_fields);
        $id = $this->request->param('id');
        $data = Db::table('jhm')->field('jhm')->where('sbk_id',$id)->where('is_sy',0)->select();
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();
        $sheet->setCellValue('A1', '激活码');
        $row = 2;
        foreach ($data as $item) {
            $sheet->setCellValue('A' . $row, $item['jhm']);
            $row++;
        }
//        $filename = '激活码' . date('YmdHis') . '.xlsx';
//        header('Content-Type: application/vnd.ms-excel');
//        header('Content-Disposition: attachment;filename="' . $filename . '"');
        $writer = new Xlsx($spreadsheet);
        $writer->save('php://output');
        $content = ob_get_contents();
        return download($content, '激活码' . date('YmdHis') . '.xlsx', true);
    }

    public function add(){
        for ($j=0;$j<3;$j++){
            $data['jhm'] = $this->random_str(30);
            Db::table('jhm')->insert($data);
        }
        $this->success('成功');
    }

    public function delete($id){
        if(Db::table('jhm')->delete($id)){
            return json(['code'=>1,'msg'=>'删除成功']);
        }else{
            return json(['code'=>0,'msg'=>'删除失败']);
        }
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

    public function test(){
        $a = $this->random_str(30);
        echo $a;
    }
}
