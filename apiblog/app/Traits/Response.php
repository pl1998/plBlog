<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/22
 * Time : 2:40 下午
 **/

namespace App\Traits;


trait Response
{
    public function success($data = [], string $message='success', $msgCode=200,int $httpCode=200)
    {
        return response()->json([
            'code' => $msgCode,
            'message' => $message,
            'data' => $data
        ], $httpCode);
    }


    /**
     * @param null $data
     * @param string $msg
     * @return \Illuminate\Http\JsonResponse |\Illuminate\Http\Response
     */
    public function fail($message,$data=[], $code = 10001,$httpCode = 500)
    {
        return response()->json(
            [
                'code' => $code,
                'message' => $message,
                'data' => $data,
                'time' => time()
            ],$httpCode);
    }
}
