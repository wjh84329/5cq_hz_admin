<?php

namespace app\admin\controller;

class Wechat
{
    /*
     * 微信公众号验证token
     * */
    public function valid(){
        $signature = $_GET["signature"];
        $timestamp = $_GET["timestamp"];
        $nonce = $_GET["nonce"];

        $token = 'bluechswechat';
        $tmpArr = array($token, $timestamp, $nonce);
        sort($tmpArr, SORT_STRING);
        $tmpStr = implode( $tmpArr );
        $tmpStr = sha1( $tmpStr );

        if( $tmpStr == $signature ){
            exit($_GET['echostr']);
        }else{
            return false;
        }
    }
}