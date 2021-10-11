<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/4/18
 * Time : 2:40 下午
 **/

namespace App\Http\Controllers;


use App\Models\Articles;
use App\Models\Category;
use App\Models\SourceProject;
use App\Models\WebsiteFooter;
use Illuminate\Http\Request;
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

    public function getSourceProject()
    {
        $list = SourceProject::all();
        return $this->success($list);
    }

    public function getCategory()
    {
        $list =  Category::with(['articles'])->get(['id','name']);
        foreach ($list as &$value){
            $value->count = $value->articles->count();
            unset($value->articles);
        }
        return $this->success($list);
    }

    public function wxCallback(Request $request)
    {
        #token wZwkDx7AKGzluE2lbN6
        #EncodingAESKey wZwkDx7AKGzluE2lbN6UEEPzPLx7YUpz3T7tDhmPcvc

        return $this->success();
    }

}
