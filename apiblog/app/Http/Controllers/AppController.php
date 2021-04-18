<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/4/18
 * Time : 2:40 下午
 **/

namespace App\Http\Controllers;


use App\Models\WebsiteFooter;
use Illuminate\Support\Facades\Redis;

class AppController extends Controller
{
    public function getWebsiteInfo()
    {
        $data = Redis::get('get_website_info');
       if(!$data){
           $data =   WebsiteFooter::query()->where('status',0)
               ->first(['name','logo','license','license_url','website'])->toArray();

           $data['logo'] = env('APP_URL').'/storage/'.$data['logo'];

           foreach ($data['website'] as &$val){

               $val['website_img'] = env('APP_URL').'/storage/'.$val['website_img'];
           }
           Redis::set('get_website_info',json_encode($data));
       }else{
           $data = json_decode($data,true);
       }
      return $this->success($data);
    }

}
