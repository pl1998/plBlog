<?php

namespace App\Providers;

use App\Models\Topics;
use App\Observers\TopicObserver;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //注册删除评论后事件
       Topics::deleting(TopicObserver::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        \Carbon\Carbon::setLocale('zh');
        //监听删除评论后事件
        Topics::observe(TopicObserver::class);
    }
}
