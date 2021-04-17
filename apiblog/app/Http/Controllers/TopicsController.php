<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/30
 * Time : 8:43 下午
 **/

namespace App\Http\Controllers;


use App\Models\Articles;
use App\Models\Topics;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class TopicsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['index']]);
    }

    public function index($id)
    {
      $data =   Topics::query()->with('user')
          ->where('article_id',$id)
          ->get(['id','content','created_at','user_id']);

      return $this->success($data);
    }

    public function store(Request $request)
    {
         $request->validate([
            'contents' => ['required','min:2'],
            'article_id' => ['required','exists:articles,id']
        ]);
         if(is_numeric($request->topic_id)){
            if( Topics::query()->where('topic_id',$request->topic_id)->exists())
            {
                Topics::query()->create([
                    'topic_id'=>$request->topic_id,
                    'content'=> $request->contents,
                    'article_id'=> $request->article_id,
                    'user_id'=>Auth::id(),
                    'ip'=>$request->getClientIp()
                ]);
                Articles::query()->findOrFail($request->article_id)->increment('browse_count');
            }
             return $this->fail('当前评论已删除或不存在');
         } else{
             Log::info('test',[$request->all()]);
             Topics::query()->create([
                 'content'=> $request->contents,
                 'article_id'=> $request->article_id,
                 'user_id'=>Auth::id(),
                 'ip'=>$request->getClientIp()
             ]);
             Articles::query()->findOrFail($request->article_id)->increment('browse_count');
         }
         return $this->success();
    }

    public function delete($id)
    {
        Log::info('user_id',[Auth::id()]);
        if(Topics::query()->where('user_id',Auth::id())->where('id',$id)->exists()) {
            Topics::query()->where('user_id',Auth::id())->delete();
            return $this->success();
        }else{
            return $this->fail('无权限删除该评论或该评论已删除',[],500,200);
        }
    }
}
