<?php

namespace app\admin\controller\business;

use app\admin\service\annotation\ControllerAnnotation;
use app\admin\service\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\facade\Db;

/**
 * @ControllerAnnotation(title="打怪红包管理")
 */
class Redkill extends AdminController
{
    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $page = max(1, (int)$this->request->param('page', 1));
            $limit = max(1, min(100, (int)$this->request->param('limit', 15)));

            $query = Db::table('ul_user_kill_red_bag');

            $id = trim((string)$this->request->param('id', ''));
            $userId = trim((string)$this->request->param('user_id', ''));
            $gwTitle = trim((string)$this->request->param('gw_title', ''));
            $status = $this->request->param('status', '');
            $grantStatus = $this->request->param('grant_status', '');

            if ($id !== '') {
                $query->where('id', (int)$id);
            }
            if ($userId !== '') {
                $query->where('user_id', (int)$userId);
            }
            if ($gwTitle !== '') {
                $query->whereLike('gw_title', '%' . $gwTitle . '%');
            }
            if ($status !== '') {
                $query->where('status', (int)$status);
            }
            if ($grantStatus !== '') {
                $query->where('grant_status', (int)$grantStatus);
            }

            $count = (clone $query)->count();

            $list = $query
                ->order('id desc')
                ->page($page, $limit)
                ->select()
                ->toArray();

            foreach ($list as &$row) {
                $row['id'] = (int)($row['id'] ?? 0);
                $row['user_id'] = (int)($row['user_id'] ?? 0);
                $row['gw_id'] = (int)($row['gw_id'] ?? 0);
                $row['amount'] = round((float)($row['amount'] ?? 0), 2);
                $row['status'] = (int)($row['status'] ?? 0);
                $row['is_cz'] = (int)($row['is_cz'] ?? 0);
                $row['grant_status'] = (int)($row['grant_status'] ?? 0);
                $row['grant_time'] = (int)($row['grant_time'] ?? 0);
                $row['create_time'] = (int)($row['create_time'] ?? 0);
                $row['update_time'] = (int)($row['update_time'] ?? 0);

                $row['create_time_text'] = $row['create_time'] > 0 ? date('Y-m-d H:i:s', $row['create_time']) : '';
                $row['update_time_text'] = $row['update_time'] > 0 ? date('Y-m-d H:i:s', $row['update_time']) : '';
                $row['grant_time_text'] = $row['grant_time'] > 0 ? date('Y-m-d H:i:s', $row['grant_time']) : '';

                $row['open_id'] = (string)($row['open_id'] ?? '');
                $row['gw_title'] = (string)($row['gw_title'] ?? '');
                $row['red_image'] = (string)($row['red_image'] ?? '');
                $row['remark'] = (string)($row['remark'] ?? '');
                $row['remark'] = (string)($row['remark'] ?? '');
                $row['yxmc'] = (string)($row['yxmc'] ?? '');
                $row['yxgw'] = (string)($row['yxgw'] ?? '');
                $row['czje'] = round((float)($row['czje'] ?? 0), 2);
                $row['hbmc'] = (string)($row['hbmc'] ?? '');
                $row['czzh'] = (string)($row['czzh'] ?? '');
                $row['czqf'] = (string)($row['czqf'] ?? '');
                $row['QQ'] = (string)($row['QQ'] ?? '');
            }
            unset($row);

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ]);
        }

        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="查看")
     */
    public function look($id)
    {
        $info = Db::table('ul_user_kill_red_bag')->where('id', (int)$id)->find();

        if (!$info) {
            $this->error('记录不存在');
        }

        $info['amount'] = round((float)($info['amount'] ?? 0), 2);
        $info['czje'] = round((float)($info['czje'] ?? 0), 2);
        $info['status_text'] = ((int)($info['status'] ?? 0) === 1) ? '未使用' : '已使用';
        $info['is_cz_text'] = ((int)($info['is_cz'] ?? 0) === 1) ? '已充值' : '未充值';
        $info['grant_status_text'] = ((int)($info['grant_status'] ?? 0) === 1) ? '已发放' : '未发放';
        $info['create_time_text'] = !empty($info['create_time']) ? date('Y-m-d H:i:s', (int)$info['create_time']) : '';
        $info['update_time_text'] = !empty($info['update_time']) ? date('Y-m-d H:i:s', (int)$info['update_time']) : '';
        $info['grant_time_text'] = !empty($info['grant_time']) ? date('Y-m-d H:i:s', (int)$info['grant_time']) : '';
        $info['remark'] = (string)($info['remark'] ?? '');

        return $this->fetch('look', [
            'info' => $info,
        ]);
    }

    /**
     * @NodeAnotation(title="发放充值")
     */
    public function grant($id)
    {
        $id = (int)$id;
        if ($id <= 0) {
            $this->error('参数错误');
        }

        $row = Db::table('ul_user_kill_red_bag')->where('id', $id)->find();
        if (!$row) {
            $this->error('记录不存在');
        }

        if ($this->request->isPost()) {
            $grantRemark = trim((string)$this->request->param('remark', ''));

            if ($grantRemark === '') {
                $this->error('请填写发放备注');
            }

            if ((int)($row['status'] ?? 0) !== 2) {
                $this->error('该红包尚未使用，不能发放');
            }

            if ((int)($row['grant_status'] ?? 0) === 1) {
                $this->error('该记录已发放');
            }

            $save = Db::table('ul_user_kill_red_bag')
                ->where('id', $id)
                ->update([
                    'grant_status' => 1,
                    'grant_time' => time(),
                    'remark' => $grantRemark,
                ]);

            if ($save === false) {
                $this->error('发放失败');
            }

            $this->success('发放成功');
        }

        $row['amount'] = round((float)($row['amount'] ?? 0), 2);
        $row['remark'] = (string)($row['remark'] ?? '');

        return $this->fetch('grant', [
            'info' => $row,
        ]);
    }
}