<?php

namespace app\admin\model;

use think\Model;

class PaymentOrder extends Model
{
    protected $table = 'payment_order';
    protected $pk = 'id';
    public $timestamps = false;

    protected $insert = ['create_time'];

    protected function setCreateTimeAttr()
    {
        return time();
    }
}
