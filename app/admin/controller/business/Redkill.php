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
            $filter = $this->parseFilter();

            $rows = [];
            $status = $filter['status'];

            if ($status === '' || (int)$status === 1) {
                $rows = array_merge($rows, $this->buildUnusedRows($filter));
            }

            if ($status === '' || (int)$status === 2) {
                $rows = array_merge($rows, $this->buildUsedBatchRows($filter));
            }

            usort($rows, function ($a, $b) {
                $aSort = (int)($a['sort_time'] ?? 0);
                $bSort = (int)($b['sort_time'] ?? 0);

                if ($aSort === $bSort) {
                    return (int)($b['id'] ?? 0) <=> (int)($a['id'] ?? 0);
                }

                return $bSort <=> $aSort;
            });

            $count = count($rows);
            $offset = ($page - 1) * $limit;
            $list = array_slice($rows, $offset, $limit);

            foreach ($list as &$row) {
                unset($row['sort_time']);
            }
            unset($row);

            return json([
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => array_values($list),
            ]);
        }

        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="查看")
     */
    public function look($id = 0)
    {
        $id = (int)$id;
        $useBatchNo = trim((string)$this->request->param('use_batch_no', ''));

        if ($useBatchNo !== '') {
            $rows = Db::table('ul_user_kill_red_bag')
                ->where('use_batch_no', $useBatchNo)
                ->order('id desc')
                ->select()
                ->toArray();

            if (empty($rows)) {
                $this->error('记录不存在');
            }

            return $this->fetch('look', [
                'info' => $this->buildBatchLookInfo($rows),
                'detailRows' => $this->buildDetailRows($rows),
            ]);
        }

        if ($id <= 0) {
            $this->error('参数错误');
        }

        $row = Db::table('ul_user_kill_red_bag')->where('id', $id)->find();
        if (!$row) {
            $this->error('记录不存在');
        }

        $batchNo = trim((string)($row['use_batch_no'] ?? ''));
        if ((int)($row['status'] ?? 0) === 2 && $batchNo !== '') {
            $rows = Db::table('ul_user_kill_red_bag')
                ->where('use_batch_no', $batchNo)
                ->order('id desc')
                ->select()
                ->toArray();

            if (!empty($rows)) {
                return $this->fetch('look', [
                    'info' => $this->buildBatchLookInfo($rows),
                    'detailRows' => $this->buildDetailRows($rows),
                ]);
            }
        }

        return $this->fetch('look', [
            'info' => $this->buildSingleLookInfo($row),
            'detailRows' => $this->buildDetailRows([$row]),
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

        $status = (int)($row['status'] ?? 0);
        if ($status !== 2) {
            $this->error('该红包尚未使用，不能发放');
        }

        $batchNo = trim((string)($row['use_batch_no'] ?? ''));
        $rows = [];

        if ($batchNo !== '') {
            $rows = Db::table('ul_user_kill_red_bag')
                ->where('use_batch_no', $batchNo)
                ->order('id desc')
                ->select()
                ->toArray();

            if (empty($rows)) {
                $this->error('批次记录不存在');
            }
        } else {
            $rows = [$row];
        }

        if ($this->request->isPost()) {
            $grantRemark = trim((string)$this->request->param('grant_remark', ''));

            if ($grantRemark === '') {
                $this->error('请填写发放备注');
            }

            foreach ($rows as $item) {
                if ((int)($item['status'] ?? 0) !== 2) {
                    $this->error('存在未使用红包，不能发放');
                }
                if ((int)($item['grant_status'] ?? 0) === 1) {
                    $this->error('该记录或该批次已发放');
                }
            }

            $saveData = [
                'grant_status' => 1,
                'grant_time' => time(),
                'grant_remark' => $grantRemark,
            ];

            if ($batchNo !== '') {
                $save = Db::table('ul_user_kill_red_bag')
                    ->where('use_batch_no', $batchNo)
                    ->update($saveData);
            } else {
                $save = Db::table('ul_user_kill_red_bag')
                    ->where('id', $id)
                    ->update($saveData);
            }

            if ($save === false) {
                $this->error('发放失败');
            }

            $this->success('发放成功');
        }

        $info = $batchNo !== '' ? $this->buildBatchLookInfo($rows) : $this->buildSingleLookInfo($row);

        return $this->fetch('grant', [
            'info' => $info,
        ]);
    }

    private function parseFilter(): array
    {
        $filter = $this->request->param('filter', '{}');
        $filter = json_decode(html_entity_decode($filter, ENT_QUOTES, 'UTF-8'), true);
        $filter = is_array($filter) ? $filter : [];

        return [
            'user_id' => trim((string)($filter['user_id'] ?? '')),
            'gw_title' => trim((string)($filter['gw_title'] ?? '')),
            'amount' => trim((string)($filter['amount'] ?? '')),
            'status' => ($filter['status'] ?? '') === '' ? '' : (int)$filter['status'],
            'grant_status' => ($filter['grant_status'] ?? '') === '' ? '' : (int)$filter['grant_status'],
            'use_batch_no' => trim((string)($filter['use_batch_no'] ?? '')),
        ];
    }

    private function buildUnusedRows(array $filter): array
    {
        $query = Db::table('ul_user_kill_red_bag')
            ->where('status', 1);

        if ($filter['user_id'] !== '') {
            $query->where('user_id', (int)$filter['user_id']);
        }

        if ($filter['gw_title'] !== '') {
            $query->whereLike('gw_title', '%' . $filter['gw_title'] . '%');
        }

        if ($filter['amount'] !== '') {
            $query->where('amount', (float)$filter['amount']);
        }

        if ($filter['grant_status'] !== '') {
            $query->where('grant_status', (int)$filter['grant_status']);
        }

        if ($filter['use_batch_no'] !== '') {
            $query->whereLike('use_batch_no', '%' . $filter['use_batch_no'] . '%');
        }

        $rows = $query
            ->field('id,open_id,user_id,gw_id,gw_title,amount,status,is_cz,grant_status,grant_time,grant_remark,use_batch_no,create_time,update_time')
            ->order('id desc')
            ->select()
            ->toArray();

        $result = [];
        foreach ($rows as $row) {
            $result[] = $this->formatSingleListRow($row);
        }

        return $result;
    }

    private function buildUsedBatchRows(array $filter): array
    {
        $query = Db::table('ul_user_kill_red_bag')
            ->where('status', 2)
            ->where('use_batch_no', '<>', '');

        if ($filter['user_id'] !== '') {
            $query->where('user_id', (int)$filter['user_id']);
        }

        $matchBatchNos = $this->findMatchedUsedBatchNos($filter);
        if (is_array($matchBatchNos)) {
            if (empty($matchBatchNos)) {
                return [];
            }
            $query->whereIn('use_batch_no', $matchBatchNos);
        }

        $rows = $query
            ->field("
                MAX(id) AS id,
                MAX(open_id) AS open_id,
                MAX(user_id) AS user_id,
                use_batch_no,
                GROUP_CONCAT(DISTINCT gw_title ORDER BY gw_title SEPARATOR '、') AS gw_title,
                COUNT(*) AS red_count,
                ROUND(SUM(amount), 2) AS amount,
                ROUND(SUM(czje), 2) AS czje,
                MIN(create_time) AS create_time,
                MAX(update_time) AS update_time,
                MAX(is_cz) AS is_cz,
                MAX(yxmc) AS yxmc,
                MAX(yxgw) AS yxgw,
                MAX(hbmc) AS hbmc,
                MAX(czzh) AS czzh,
                MAX(czqf) AS czqf,
                MAX(QQ) AS QQ,
                MIN(grant_status) AS min_grant_status,
                MAX(grant_status) AS max_grant_status,
                MAX(grant_time) AS grant_time,
                MAX(grant_remark) AS grant_remark
            ")
            ->group('use_batch_no')
            ->select()
            ->toArray();

        $result = [];
        foreach ($rows as $row) {
            $item = $this->formatBatchListRow($row);

            if ($filter['amount'] !== '' && abs((float)$item['amount'] - (float)$filter['amount']) > 0.0001) {
                continue;
            }

            if ($filter['grant_status'] !== '' && (int)$item['grant_status'] !== (int)$filter['grant_status']) {
                continue;
            }

            $result[] = $item;
        }

        return $result;
    }

    private function findMatchedUsedBatchNos(array $filter): ?array
    {
        $needBatchMatch = ($filter['gw_title'] !== '') || ($filter['use_batch_no'] !== '');
        if (!$needBatchMatch) {
            return null;
        }

        $query = Db::table('ul_user_kill_red_bag')
            ->where('status', 2)
            ->where('use_batch_no', '<>', '');

        if ($filter['user_id'] !== '') {
            $query->where('user_id', (int)$filter['user_id']);
        }

        if ($filter['gw_title'] !== '') {
            $query->whereLike('gw_title', '%' . $filter['gw_title'] . '%');
        }

        if ($filter['use_batch_no'] !== '') {
            $query->whereLike('use_batch_no', '%' . $filter['use_batch_no'] . '%');
        }

        $batchNos = $query->column('use_batch_no');
        $batchNos = array_values(array_unique(array_filter(array_map('strval', $batchNos))));

        return $batchNos;
    }

    private function formatSingleListRow(array $row): array
    {
        $status = (int)($row['status'] ?? 0);
        $grantStatus = (int)($row['grant_status'] ?? 0);
        $grantStatusText = $grantStatus === 1 ? '已发放' : '未发放';

        return [
            'id' => (int)($row['id'] ?? 0),
            'open_id' => (string)($row['open_id'] ?? ''),
            'user_id' => (int)($row['user_id'] ?? 0),
            'gw_title' => (string)($row['gw_title'] ?? ''),
            'amount' => round((float)($row['amount'] ?? 0), 2),
            'status' => $status,
            'status_text' => $status === 2 ? '已使用' : '未使用',
            'red_count' => 1,
            'is_cz' => (int)($row['is_cz'] ?? 0),
            'grant_status' => $grantStatus,
            'grant_status_text' => $grantStatusText,
            'grant_time' => (int)($row['grant_time'] ?? 0),
            'grant_remark' => (string)($row['grant_remark'] ?? ''),
            'use_batch_no' => (string)($row['use_batch_no'] ?? ''),
            'create_time' => (int)($row['create_time'] ?? 0),
            'update_time' => (int)($row['update_time'] ?? 0),
            'create_time_text' => $this->formatTime((int)($row['create_time'] ?? 0)),
            'update_time_text' => $status === 2 ? $this->formatTime((int)($row['update_time'] ?? 0), '——') : '——',
            'grant_time_text' => $grantStatus === 1 ? $this->formatTime((int)($row['grant_time'] ?? 0), '——') : '——',
            'row_mode' => 'single',
            'sort_time' => $status === 2 ? (int)($row['update_time'] ?? 0) : (int)($row['create_time'] ?? 0),
        ];
    }

    private function formatBatchListRow(array $row): array
    {
        $minGrantStatus = (int)($row['min_grant_status'] ?? 0);
        $maxGrantStatus = (int)($row['max_grant_status'] ?? 0);

        if ($minGrantStatus === 1 && $maxGrantStatus === 1) {
            $grantStatus = 1;
            $grantStatusText = '已发放';
        } elseif ($minGrantStatus === 0 && $maxGrantStatus === 0) {
            $grantStatus = 0;
            $grantStatusText = '未发放';
        } else {
            $grantStatus = 2;
            $grantStatusText = '部分发放';
        }

        $redCount = max(1, (int)($row['red_count'] ?? 1));
        $amount = round((float)($row['amount'] ?? 0), 2);

        return [
            'id' => (int)($row['id'] ?? 0),
            'open_id' => (string)($row['open_id'] ?? ''),
            'user_id' => (int)($row['user_id'] ?? 0),
            'gw_title' => (string)($row['gw_title'] ?? ''),
            'amount' => $amount,
            'status' => 2,
            'status_text' => '使用' . $redCount . '个红包',
            'red_count' => $redCount,
            'is_cz' => (int)($row['is_cz'] ?? 0),
            'grant_status' => $grantStatus,
            'grant_status_text' => $grantStatusText,
            'grant_time' => (int)($row['grant_time'] ?? 0),
            'grant_remark' => (string)($row['grant_remark'] ?? ''),
            'use_batch_no' => (string)($row['use_batch_no'] ?? ''),
            'create_time' => (int)($row['create_time'] ?? 0),
            'update_time' => (int)($row['update_time'] ?? 0),
            'create_time_text' => $this->formatTime((int)($row['create_time'] ?? 0)),
            'update_time_text' => $this->formatTime((int)($row['update_time'] ?? 0), '——'),
            'grant_time_text' => $grantStatus === 1 ? $this->formatTime((int)($row['grant_time'] ?? 0), '——') : '——',
            'row_mode' => 'batch',
            'sort_time' => (int)($row['update_time'] ?? 0),
        ];
    }

    private function buildSingleLookInfo(array $row): array
    {
        $status = (int)($row['status'] ?? 0);
        $grantStatus = (int)($row['grant_status'] ?? 0);

        return [
            'id' => (int)($row['id'] ?? 0),
            'row_mode' => 'single',
            'use_batch_no' => (string)($row['use_batch_no'] ?? ''),
            'open_id' => (string)($row['open_id'] ?? ''),
            'user_id' => (int)($row['user_id'] ?? 0),
            'gw_id' => (int)($row['gw_id'] ?? 0),
            'gw_title' => (string)($row['gw_title'] ?? ''),
            'amount' => round((float)($row['amount'] ?? 0), 2),
            'red_count' => 1,
            'status_text' => $status === 2 ? '已使用' : '未使用',
            'is_cz_text' => ((int)($row['is_cz'] ?? 0) === 1) ? '已充值' : '未充值',
            'grant_status_text' => $grantStatus === 1 ? '已发放' : '未发放',
            'grant_remark' => (string)($row['grant_remark'] ?? ''),
            'create_time_text' => $this->formatTime((int)($row['create_time'] ?? 0)),
            'update_time_text' => $status === 2 ? $this->formatTime((int)($row['update_time'] ?? 0), '——') : '——',
            'grant_time_text' => $grantStatus === 1 ? $this->formatTime((int)($row['grant_time'] ?? 0), '——') : '——',
            'yxmc' => (string)($row['yxmc'] ?? ''),
            'yxgw' => (string)($row['yxgw'] ?? ''),
            'czje' => round((float)($row['czje'] ?? 0), 2),
            'hbmc' => (string)($row['hbmc'] ?? ''),
            'czzh' => (string)($row['czzh'] ?? ''),
            'czqf' => (string)($row['czqf'] ?? ''),
            'QQ' => (string)($row['QQ'] ?? ''),
        ];
    }

    private function buildBatchLookInfo(array $rows): array
    {
        $first = reset($rows);
        $redCount = count($rows);
        $totalAmount = 0;
        $totalCzje = 0;
        $createTimes = [];
        $updateTimes = [];
        $grantTimes = [];
        $gwTitles = [];
        $grantStatuses = [];

        foreach ($rows as $row) {
            $totalAmount += round((float)($row['amount'] ?? 0), 2);
            $totalCzje += round((float)($row['czje'] ?? 0), 2);
            $createTimes[] = (int)($row['create_time'] ?? 0);
            $updateTimes[] = (int)($row['update_time'] ?? 0);
            $grantTimes[] = (int)($row['grant_time'] ?? 0);
            $grantStatuses[] = (int)($row['grant_status'] ?? 0);

            $gwTitle = trim((string)($row['gw_title'] ?? ''));
            if ($gwTitle !== '') {
                $gwTitles[] = $gwTitle;
            }
        }

        $gwTitles = array_values(array_unique($gwTitles));
        $minGrantStatus = empty($grantStatuses) ? 0 : min($grantStatuses);
        $maxGrantStatus = empty($grantStatuses) ? 0 : max($grantStatuses);

        if ($minGrantStatus === 1 && $maxGrantStatus === 1) {
            $grantStatusText = '已发放';
            $grantStatus = 1;
        } elseif ($minGrantStatus === 0 && $maxGrantStatus === 0) {
            $grantStatusText = '未发放';
            $grantStatus = 0;
        } else {
            $grantStatusText = '部分发放';
            $grantStatus = 2;
        }

        $maxGrantTime = empty($grantTimes) ? 0 : max($grantTimes);

        return [
            'id' => (int)($first['id'] ?? 0),
            'row_mode' => 'batch',
            'use_batch_no' => (string)($first['use_batch_no'] ?? ''),
            'open_id' => (string)($first['open_id'] ?? ''),
            'user_id' => (int)($first['user_id'] ?? 0),
            'gw_id' => 0,
            'gw_title' => implode('、', $gwTitles),
            'amount' => round($totalAmount, 2),
            'red_count' => $redCount,
            'status_text' => '使用' . $redCount . '个红包',
            'is_cz_text' => ((int)($first['is_cz'] ?? 0) === 1) ? '已充值' : '未充值',
            'grant_status_text' => $grantStatusText,
            'grant_status' => $grantStatus,
            'grant_remark' => (string)($first['grant_remark'] ?? ''),
            'create_time_text' => $this->formatTime(empty($createTimes) ? 0 : min($createTimes)),
            'update_time_text' => $this->formatTime(empty($updateTimes) ? 0 : max($updateTimes), '——'),
            'grant_time_text' => $grantStatus === 1 ? $this->formatTime($maxGrantTime, '——') : '——',
            'yxmc' => (string)($first['yxmc'] ?? ''),
            'yxgw' => (string)($first['yxgw'] ?? ''),
            'czje' => round($totalCzje > 0 ? $totalCzje : $totalAmount, 2),
            'hbmc' => (string)($first['hbmc'] ?? ''),
            'czzh' => (string)($first['czzh'] ?? ''),
            'czqf' => (string)($first['czqf'] ?? ''),
            'QQ' => (string)($first['QQ'] ?? ''),
        ];
    }

    private function buildDetailRows(array $rows): array
    {
        $result = [];

        foreach ($rows as $row) {
            $status = (int)($row['status'] ?? 0);
            $grantStatus = (int)($row['grant_status'] ?? 0);

            $result[] = [
                'id' => (int)($row['id'] ?? 0),
                'use_batch_no' => (string)($row['use_batch_no'] ?? ''),
                'gw_title' => (string)($row['gw_title'] ?? ''),
                'amount' => round((float)($row['amount'] ?? 0), 2),
                'status_text' => $status === 2 ? '已使用' : '未使用',
                'grant_status_text' => $grantStatus === 1 ? '已发放' : '未发放',
                'create_time_text' => $this->formatTime((int)($row['create_time'] ?? 0)),
                'update_time_text' => $status === 2 ? $this->formatTime((int)($row['update_time'] ?? 0), '——') : '——',
                'grant_time_text' => $grantStatus === 1 ? $this->formatTime((int)($row['grant_time'] ?? 0), '——') : '——',
                'grant_remark' => (string)($row['grant_remark'] ?? ''),
            ];
        }

        return $result;
    }

    private function formatTime(int $timestamp, string $default = ''): string
    {
        return $timestamp > 0 ? date('Y-m-d H:i:s', $timestamp) : $default;
    }
}