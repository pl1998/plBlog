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

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
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
        $data = $query->forPage($page,$limit)
            ->get()->map(function ($item){
                $item->cover_img = env('APP_URL').'/storage/'.$item->cover_img;
                return $item;
            });

        return $this->success([
            'list'=>$data,
            'meta'=>[
                'total'=>$total,
                'pageSize'=>$limit
            ]
        ]);
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
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

        $articles = $articles->map(function ($item){
            $item->cover_img = env('APP_URL').'/storage/'.$item->cover_img;
            return $item;
        });

        return $this->success($articles);
    }

    /**
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function show($id)
    {
        $shows = Articles::query()->find($id);
        return $this->success($shows);
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     */
    public function ArticleArchive()
    {
        $list = Articles::query()
            ->orderByDesc('created_at')
            ->where('status',0)
            ->get(['id','title','created_at','cover_img','description'])
            ->map(function ($item,$key){
                $item->cover_img = env('APP_URL').'/storage/'.$item->cover_img;
                if($key<3){
                    $item->icon='el-icon-more';
                    $item->color='#0bbd87';
                    $item->type='primary';
                    $item->size='large';
                }
                return $item;
            });

        return $this->success($list);
    }
}
