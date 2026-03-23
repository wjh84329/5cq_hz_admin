<?php

namespace app\admin\model;

use app\common\model\TimeModel;

class Sbk extends TimeModel
{

    public function del($sbk_id){
        return $this->whereIn('sbk_id',$sbk_id)->delete();
    }
}