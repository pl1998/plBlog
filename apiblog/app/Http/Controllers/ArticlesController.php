<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/22
 * Time : 2:39 下午
 **/

namespace App\Http\Controllers;



use App\Models\Articles;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redis;

class ArticlesController extends Controller
{

    protected static $hostArticles = 'hot_article';

    public function index(Request $request)
    {

        $page     = $request->get('page',1);
        $limit    = $request->get('pageSize',10);
        $keywords = $request->get('keywords');

        $query = Articles::query()
            ->orderByDesc('weight')
            ->orderByDesc('created_at')
            ->where('status',0);

        if($keywords){
            $query =   $query->where('label','like',"%$keywords%");
        }


        $total = $query->count();

        $data = $query->forPage($page,$limit)->get();
        foreach ($data as $val){
            $val->cover_img = env('APP_URL').'/storage/'.$val->cover_img;
        }

        return $this->success([
            'list'=>$data,
            'meta'=>[
                'total'=>$total,
                'pageSize'=>$limit
            ]
        ]);
    }

    public function hotList()
    {
        $articleIds = Redis::connection()->client()->zRevRange(static::$hostArticles,0,5);

        if(!empty($articleIds)) {
            $idStr = implode(',',$articleIds);
            $articles = Articles::query()->where('status',0)
                ->whereIn('id',$articleIds)
                ->orderByRaw('field(`id`, ' . $idStr . ')')
                ->get(['title','cover_img','description','id']);
        } else {
            $articles = Articles::query()->where('status',0)
                ->orderByDesc('review_count')
                ->limit(5)
                ->get(['title','cover_img','description','id']);
        }
        foreach ($articles as $value){
            $value->cover_img = env('APP_URL').'/storage/'.$value->cover_img;
        }

        return $this->success($articles);
    }

    public function show($id)
    {
        #Redis::connection()->client()->zIncrBy(static::$hostArticles,1,$id);
        $shows = Articles::query()->find($id);
        #Articles::query()->where('id',$id)->increment('review_count');
        return $this->success($shows);
    }

    public function ArticleArchive()
    {

        $list = Articles::query()
            ->orderByDesc('created_at')
            ->where('status',0)
            ->get(['id','title','created_at','cover_img','description']);

        foreach ($list as $key=> &$value){
            $value->cover_img = env('APP_URL').'/storage/'.$value->cover_img;
            if($key<3){
                $value->icon='el-icon-more';
                $value->color='#0bbd87';
                $value->type='primary';
                $value->size='large';
            }
        }

        return $this->success($list);
    }
}
