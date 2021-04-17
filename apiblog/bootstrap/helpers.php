<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/23
 * Time : 11:07 上午
 **/
use Illuminate\Support\Facades\Redis;

if(!function_exists('redis')) {
    function redis()
    {
        return Redis::connection()->client();
    }
}
