<?php

namespace App\Jobs;

use App\Mail\TopicsSend;
use App\Models\Topics;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class EmailNotificationJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $topic_id;
    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($topic_id)
    {
        $this->topic_id = $topic_id;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
      $topic =   Topics::with(['article','user'])->find($this->topic_id);
      Mail::send(new TopicsSend($topic));
    }
}
