<?php

namespace App\Observers;

use App\Models\Topics;
use Illuminate\Support\Facades\Log;

class TopicObserver
{
    //
    public function deleted(Topics $topic)
    {
        Log::info('test',$topic->toArray());
        $topic->article()->decrement('browse_count');
    }
}
