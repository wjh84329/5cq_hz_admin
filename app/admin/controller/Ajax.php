<?php


namespace app\admin\controller;

use app\admin\model\SystemUploadfile;
use app\common\controller\AdminController;
use app\common\service\MenuService;
use app\common\service\UploadService;
use think\db\Query;
use think\facade\Cache;


class Ajax extends AdminController
{

    /**
     * 初始化后台接口地址
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function initAdmin()
    {
        $cacheData = Cache::get('initAdmin_' . session('admin.id'));
        if (!empty($cacheData)) {
            return json($cacheData);
        }
        $menuService = new MenuService(session('admin.id'));
        $data = [
            'logoInfo' => [
                'title' => sysconfig('site', 'logo_title'),
                'image' => sysconfig('site', 'logo_image'),
                'href'  => __url('index/index'),
            ],
            'homeInfo' => $menuService->getHomeInfo(),
            'menuInfo' => $menuService->getMenuTree(),
        ];
        Cache::tag('initAdmin')->set('initAdmin_' . session('admin.id'), $data);
        return json($data);
    }

    /**
     * 清理缓存接口
     */
    public function clearCache()
    {
        Cache::clear();
        $this->success('清理缓存成功');
    }

    /**
     * 上传文件
     */
//     public function upload()
//     {
//         $this->checkPostRequest();
//         $data = [
//             'upload_type' => $this->request->post('upload_type'),
//             'file'        => $this->request->file('file'),
//         ];

//         try {

//             $upload_service = new UploadService($data['upload_type']);

// //            $upload_service->validateException($data['file']);

//             $result = $upload_service->save($data['file']);
//         } catch (\Exception $e) {
//             $this->error($e->getMessage());
//         }

//         $this->success('上传成功', $result);
//     }
    public function upload()
    {
        $this->checkPostRequest();
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('file'),
        ];

        try {
            $upload_service = new UploadService($data['upload_type']);
            $result = $upload_service->save($data['file']);
        } catch (\Throwable $e) {
            $this->error('upload-exception: ' . $e->getMessage());
        }

        // 通过 debug_step 分阶段验证：1 -> 2 -> 3
        $step = (int)$this->request->post('debug_step', 1);

        $safe = [
                'id'        => (int)($result->id ?? 0),
                'url'       => (string)($result->url ?? ''),
                'save_name' => (string)($result->save_name ?? ''),
                'file_ext'  => (string)($result->file_ext ?? ''),
                'file_size' => (int)($result->file_size ?? 0),
            ];
            $this->success('上传成功', $safe);

        // step=3：返回完整数组前，先做 UTF-8 清洗
        // $arr = method_exists($result, 'toArray') ? $result->toArray() : (array)$result;
        // $arr = $this->cleanUtf8($arr);

        // $this->success('ok-step3', $arr);
    }

    private function cleanUtf8($data)
    {
        if (is_array($data)) {
            foreach ($data as $k => $v) {
                $data[$k] = $this->cleanUtf8($v);
            }
            return $data;
        }

        if (is_string($data)) {
            // 是有效 UTF-8 就直接返回
            if (preg_match('//u', $data)) {
                return $data;
            }

            // 先按常见中文编码转 UTF-8
            $tmp = @iconv('GBK', 'UTF-8//IGNORE', $data);
            if ($tmp !== false && $tmp !== '') {
                return $tmp;
            }

            // 最后兜底：丢弃非法字节
            $tmp = @iconv('UTF-8', 'UTF-8//IGNORE', $data);
            return $tmp === false ? '' : $tmp;
        }

        return $data;
    }

    /**
     * 上传图片至编辑器
     * @return \think\response\Json
     */
    public function uploadEditor()
    {
        $this->checkPostRequest();
        $data = [
            'upload_type' => $this->request->post('upload_type'),
            'file'        => $this->request->file('upload'),
        ];

        try {
            $upload_service = new UploadService($data['upload_type']);

            $upload_service->validateException($data['file']);

            $result = $upload_service->save($data['file']);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }

        return json([
            'error'    => [
                'message' => '上传成功',
                'number'  => 201,
            ],
            'fileName' => '',
            'uploaded' => 1,
            'url'      => $result['url'],
        ]);
    }

    /**
     * 获取上传文件列表
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getUploadFiles()
    {
        $get = $this->request->get();
        $page = isset($get['page']) && !empty($get['page']) ? $get['page'] : 1;
        $limit = isset($get['limit']) && !empty($get['limit']) ? $get['limit'] : 10;
        $title = isset($get['title']) && !empty($get['title']) ? $get['title'] : null;
        $this->model = new SystemUploadfile();
        $count = $this->model
            ->where(function (Query $query) use ($title) {
                !empty($title) && $query->where('original_name', 'like', "%{$title}%");
            })
            ->count();
        $list = $this->model
            ->where(function (Query $query) use ($title) {
                !empty($title) && $query->where('original_name', 'like', "%{$title}%");
            })
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
}
