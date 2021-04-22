<?php

namespace App\Mail;


use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;


class TopicsSend extends Mailable
{
    use Queueable, SerializesModels;

    protected $topics;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($topics)
    {
        $this->topics = $topics;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(env('MAIL_SEND_ADDRESS'))
            ->view('email.topics_notification',[
                'topic'=>$this->topics
        ]);
    }
}
