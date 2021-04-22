<?php

namespace App\Jobs;

use App\Models\Articles;
use App\Models\VisitorRegistry;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Redis;


class VisitorsToRecordJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $ip;
    protected $article_id;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($ip,$article_id)
    {
        $this->ip = $ip;
        $this->article_id = $article_id;
    }
    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        //文章查看自增
        $result =  Articles::query()->where('id',$this->article_id)->increment('review_count');
        if($result) {
            //热门文章
            Redis::connection()->client()->zIncrBy('hot_article',1,$this->article_id);
            //日志记录
            $ipInfo = geoip($this->ip);
            VisitorRegistry::query()->create([
                'art_id'=>$this->article_id,
                'ip' =>$this->ip,
                'address' => $ipInfo->state_name.'-'.$ipInfo->city,
            ]);
        }
    }
}
