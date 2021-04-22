<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/30
 * Time : 8:43 下午
 **/

namespace App\Http\Controllers;


use App\Jobs\EmailNotificationJob;
use App\Models\Articles;
use App\Models\Topics;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TopicsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['index']]);
    }

    public function index($id)
    {
      $data =   Topics::with(['user','childs'])
          ->where('topic_id',0)
          ->where('article_id',$id)
          ->get(['id','content','created_at','user_id','address']);

      return $this->success($data);
    }

    public function store(Request $request)
    {
         $request->validate([
            'contents' => ['required','min:2'],
            'article_id' => ['required','exists:articles,id'],
        ]);


         $ipInfo = geoip($request->getClientIp());
         if(is_numeric($request->topic_id)){
            if( Topics::query()->where('id',$request->topic_id)->exists())
            {
                $install = [
                    'topic_id'=>$request->topic_id,
                    'content'=> $request->contents,
                    'article_id'=> $request->article_id,
                    'user_id'=>Auth::id(),
                    'ip'=>$request->getClientIp(),
                    'address'=>$ipInfo->state_name.' '.$ipInfo->city,
                    'created_at'=>now()->toDate(),
                    'updated_at'=>now()->toDate()
                ];
            }else{
                return $this->fail('当前评论已删除或不存在');
            }
         } else{
             $install = [
                 'content'=> $request->contents,
                 'article_id'=> $request->article_id,
                 'user_id'=>Auth::id(),
                 'ip'=>$request->getClientIp(),
                 'address'=>$ipInfo->state_name.' '.$ipInfo->city,
                 'created_at'=>now()->toDate(),
                 'updated_at'=>now()->toDate()
             ];

         }
        $id = Topics::query()->insertGetId($install);
        EmailNotificationJob::dispatch($id);
        Articles::query()->findOrFail($request->article_id)->increment('browse_count');

         return $this->success();
    }

    public function delete($id)
    {
        if(Topics::query()->where('user_id',Auth::id())->where('id',$id)->exists()) {
            Topics::destroy($id);
            return $this->success();
        }else{
            return $this->fail('无权限删除该评论或该评论已删除',[],500,200);
        }
    }
}
