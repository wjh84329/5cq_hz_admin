<?php


namespace app\admin\controller\system;


use app\admin\model\SystemUploadfile;
use app\common\controller\AdminController;
use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * @ControllerAnnotation(title="上传文件管理")
 * Class Uploadfile
 * @package app\admin\controller\system
 */
class Api extends AdminController
{

    use \app\admin\traits\Curd;

    public function index()
    {
        $list = Db::table('api_config')->find(1);
        if ($this->request->isAjax()) {
            $data = $this->request->param();
            if (Db::table('api_config')->where('id', '1')->update($data) !== false) {
                $this->success('提交成功');
            } else {
                $this->error('提交失败');
            }
        }
        return $this->fetch(
            'index',[
                'list' => $list
            ]
        );
    }

}