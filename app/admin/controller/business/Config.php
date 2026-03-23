<?php

namespace app\admin\controller\business;

use app\common\controller\AdminController;
use app\Request;
use think\facade\Db;
use think\helper\Str;
use think\Model;
use app\admin\model\BusinessConfig;

class Config extends AdminController
{
    public function index(){
        $basic = Db::table('basic')->where('name', 'basic')->find();
        $operation = Db::table('operation')->where('name', 'operation')->find();
        $luckyCoin = Db::table('luckyCoin')->where('name', 'luckyCoin')->find();
        $luckyPrize = Db::table('luckyPrize')->where('name', 'luckyPrize')->find();
        if ($this->request->isAjax()) {
            $name = $this->request->post('name');
            if($name=='basic'){
//                $data['smsCode'] = $this->request->post('smsCode');
                $data['sbkBanner'] = $this->request->post('sbkBanner');
                $data['qq'] = $this->request->post('qq');
                $data['wechatQf'] = $this->request->post('wechatQf');
                $data['avatar'] = $this->request->post('avatar');
                $data['yx_url'] = $this->request->post('yx_url');
//                $data['wechatQf'] = $this->request->post('wechatQf');
                if (Db::table('basic')->where('id', '1')->update($data) !== false) {
                    $this->success('提交成功');
                } else {
                    $this->error('提交失败');
                }
            }elseif ($name=='operation'){
                $data['sharUserMoney1'] = $this->request->post('sharUserMoney1');
                $data['sharUserMoney2'] = $this->request->post('sharUserMoney2');
                $data['sharUserPercentage1'] = $this->request->post('sharUserPercentage1');
                $data['sharUserPercentage2'] = $this->request->post('sharUserPercentage2');
                $data['registerCoin'] = $this->request->post('registerCoin');
                $data['signlnCoin'] = $this->request->post('signlnCoin');
                $data['signlnCoin3'] = $this->request->post('signlnCoin3');
                $data['signlnCoin7'] = $this->request->post('signlnCoin7');
                $data['signlnCoin14'] = $this->request->post('signlnCoin14');
                $data['signlnCoin28'] = $this->request->post('signlnCoin28');
                $data['mainCoin'] = $this->request->post('mainCoin');
                $data['postCoin'] = $this->request->post('postCoin');
                $data['postNumber'] = $this->request->post('postNumber');
                $data['lookGame'] = $this->request->post('lookGame');
                $data['lookGameNumber'] = $this->request->post('lookGameNumber');
                $data['boxCoin30'] = $this->request->post('boxCoin30');
                $data['boxCoin60'] = $this->request->post('boxCoin60');
                $data['boxCoin120'] = $this->request->post('boxCoin120');
                $data['boxCoin240'] = $this->request->post('boxCoin240');
                $data['luckCoinConsume'] = $this->request->post('luckCoinConsume');
                $data['luckPrizeCoinConsume'] = $this->request->post('luckPrizeCoinConsume');
                $data['coinToMoney'] = $this->request->post('coinToMoney');
                $data['renwu1'] = $this->request->post('renwu1');
                $data['renwu2'] = $this->request->post('renwu2');
                $data['renwu3'] = $this->request->post('renwu3');
                $data['luck'] = $this->request->post('luck');
                $data['list_statu'] = $this->request->post('list_statu');
                $data['reduce'] = $this->request->post('reduce');
                Db::table('luckyCoin')->where('id',1)->update(['luckCoinConsume'=>$data['luckCoinConsume']]);
                Db::table('luckyPrize')->where('id',1)->update(['luckPrizeCoinConsume'=>$data['luckPrizeCoinConsume']]);
                if (Db::table('operation')->where('id', '1')->update($data) !== false) {
                    $this->success('提交成功');
                } else {
                    $this->error('提交失败');
                }
            }elseif ($name=='luckyCoin'){
                $data['luckyCoinBackgroundImage'] = $this->request->post('luckyCoinBackgroundImage');
                $data['luckyCoinItemBackgroundColor'] = $this->request->post('luckyCoinItemBackgroundColor');
                $data['luckyCoinItemSelectBackgroundColor'] = $this->request->post('luckyCoinItemSelectBackgroundColor');
                $data['luckyCoinStartBtn'] = $this->request->post('luckyCoinStartBtn');
                $data['luckyCoinImg'] = $this->request->post('luckyCoinImg');
                $data['luckyCoinItemImg1'] = $this->request->post('luckyCoinItemImg1');
                $data['luckyCoinItemTitle1'] = $this->request->post('luckyCoinItemTitle1');
                $data['luckyCoinItemNumber1'] = $this->request->post('luckyCoinItemNumber1');
                $data['luckyCoinItemProb1'] = $this->request->post('luckyCoinItemProb1');
                $data['luckyCoinItemImg2'] = $this->request->post('luckyCoinItemImg2');
                $data['luckyCoinItemTitle2'] = $this->request->post('luckyCoinItemTitle2');
                $data['luckyCoinItemNumber2'] = $this->request->post('luckyCoinItemNumber2');
                $data['luckyCoinItemProb2'] = $this->request->post('luckyCoinItemProb2');
                $data['luckyCoinItemImg3'] = $this->request->post('luckyCoinItemImg3');
                $data['luckyCoinItemTitle3'] = $this->request->post('luckyCoinItemTitle3');
                $data['luckyCoinItemNumber3'] = $this->request->post('luckyCoinItemNumber3');
                $data['luckyCoinItemProb3'] = $this->request->post('luckyCoinItemProb3');
                $data['luckyCoinItemImg4'] = $this->request->post('luckyCoinItemImg4');
                $data['luckyCoinItemTitle4'] = $this->request->post('luckyCoinItemTitle4');
                $data['luckyCoinItemNumber4'] = $this->request->post('luckyCoinItemNumber4');
                $data['luckyCoinItemProb4'] = $this->request->post('luckyCoinItemProb4');
                $data['luckyCoinItemImg5'] = $this->request->post('luckyCoinItemImg5');
                $data['luckyCoinItemTitle5'] = $this->request->post('luckyCoinItemTitle5');
//                $data['luckyCoinItemTitle5'] = $this->request->post('luckyCoinItemTitle5');
                $data['luckyCoinItemNumber5'] = $this->request->post('luckyCoinItemNumber5');
                $data['luckyCoinItemProb5'] = $this->request->post('luckyCoinItemProb5');
                $data['luckyCoinItemImg6'] = $this->request->post('luckyCoinItemImg6');
                $data['luckyCoinItemTitle6'] = $this->request->post('luckyCoinItemTitle6');
                $data['luckyCoinItemNumber6'] = $this->request->post('luckyCoinItemNumber6');
                $data['luckyCoinItemProb6'] = $this->request->post('luckyCoinItemProb6');
                $data['luckyCoinItemImg7'] = $this->request->post('luckyCoinItemImg7');
                $data['luckyCoinItemTitle7'] = $this->request->post('luckyCoinItemTitle7');
                $data['luckyCoinItemNumber7'] = $this->request->post('luckyCoinItemNumber7');
                $data['luckyCoinItemProb7'] = $this->request->post('luckyCoinItemProb7');
                $data['luckyCoinItemImg8'] = $this->request->post('luckyCoinItemImg8');
                $data['luckyCoinItemTitle8'] = $this->request->post('luckyCoinItemTitle8');
                $data['luckyCoinItemNumber8'] = $this->request->post('luckyCoinItemNumber8');
                $data['luckyCoinItemProb8'] = $this->request->post('luckyCoinItemProb8');
                if (Db::table('luckyCoin')->where('id', '1')->update($data) !== false) {
                    $this->success('提交成功');
                } else {
                    $this->error('提交失败');
                }
            }elseif ($name=='luckyPrize'){
                $data['luckyPrizeBackgroundImage'] = $this->request->post('luckyPrizeBackgroundImage');
                $data['luckyPrizeItemBackgroundColor'] = $this->request->post('luckyPrizeItemBackgroundColor');
                $data['luckyPrizeItemSelectBackgroundColor'] = $this->request->post('luckyPrizeItemSelectBackgroundColor');
                $data['luckyPrizeStartBtn'] = $this->request->post('luckyPrizeStartBtn');
                $data['luckyPrizeImg'] = $this->request->post('luckyPrizeImg');
                $data['luckyPrizeItemImg1'] = $this->request->post('luckyPrizeItemImg1');
                $data['luckyPrizeItemTitle1'] = $this->request->post('luckyPrizeItemTitle1');
//                $data['luckyPrizeItemNumber1'] = $this->request->post('luckyPrizeItemNumber1');
                $data['luckyPrizeItemProb1'] = $this->request->post('luckyPrizeItemProb1');
                $data['luckyPrizeItemImg2'] = $this->request->post('luckyPrizeItemImg2');
                $data['luckyPrizeItemTitle2'] = $this->request->post('luckyPrizeItemTitle2');
//                $data['luckyPrizeItemNumber2'] = $this->request->post('luckyPrizeItemNumber2');
                $data['luckyPrizeItemProb2'] = $this->request->post('luckyPrizeItemProb2');
                $data['luckyPrizeItemImg3'] = $this->request->post('luckyPrizeItemImg3');
                $data['luckyPrizeItemTitle3'] = $this->request->post('luckyPrizeItemTitle3');
//                $data['luckyPrizeItemNumber3'] = $this->request->post('luckyPrizeItemNumber3');
                $data['luckyPrizeItemProb3'] = $this->request->post('luckyPrizeItemProb3');
                $data['luckyPrizeItemImg4'] = $this->request->post('luckyPrizeItemImg4');
                $data['luckyPrizeItemTitle4'] = $this->request->post('luckyPrizeItemTitle4');
//                $data['luckyPrizeItemNumber4'] = $this->request->post('luckyPrizeItemNumber4');
                $data['luckyPrizeItemProb4'] = $this->request->post('luckyPrizeItemProb4');
                $data['luckyPrizeItemImg5'] = $this->request->post('luckyPrizeItemImg5');
                $data['luckyPrizeItemTitle5'] = $this->request->post('luckyPrizeItemTitle5');
                $data['luckyPrizeItemProb5'] = $this->request->post('luckyPrizeItemProb5');
//                $data['luckyPrizeItemNumber5'] = $this->request->post('luckyPrizeItemNumber5');
//                $data['luckyPrizeItemProb5'] = $this->request->post('luckyPrizeItemProb5');
                $data['luckyPrizeItemImg6'] = $this->request->post('luckyPrizeItemImg6');
                $data['luckyPrizeItemTitle6'] = $this->request->post('luckyPrizeItemTitle6');
//                $data['luckyPrizeItemNumber6'] = $this->request->post('luckyPrizeItemNumber6');
                $data['luckyPrizeItemProb6'] = $this->request->post('luckyPrizeItemProb6');
                $data['luckyPrizeItemImg7'] = $this->request->post('luckyPrizeItemImg7');
                $data['luckyPrizeItemTitle7'] = $this->request->post('luckyPrizeItemTitle7');
//                $data['luckyPrizeItemNumber7'] = $this->request->post('luckyPrizeItemNumber7');
                $data['luckyPrizeItemProb7'] = $this->request->post('luckyPrizeItemProb7');
                $data['luckyPrizeItemImg8'] = $this->request->post('luckyPrizeItemImg8');
                $data['luckyPrizeItemTitle8'] = $this->request->post('luckyPrizeItemTitle8');
//                $data['luckyPrizeItemNumber8'] = $this->request->post('luckyPrizeItemNumber8');
                $data['luckyPrizeItemProb8'] = $this->request->post('luckyPrizeItemProb8');
                if (Db::table('luckyPrize')->where('id', '1')->update($data) !== false) {
                    $this->success('提交成功');
                } else {
                    $this->error('提交失败');
                }
            }

        }
        return $this->fetch(
            'index',
            [
                'basic' => $basic,
                'operation'=>$operation,
                'luckyCoin'=>$luckyCoin,
                'luckyPrize'=>$luckyPrize,
            ]
        );
//        return $this->fetch();
    }

    public function test(){
//        $a = $this->checkPostRequest();

        return json('1');
    }
}