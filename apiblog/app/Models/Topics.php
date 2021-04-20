<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/4/17
 * Time : 11:15 上午
 **/

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Topics extends Model
{
    use SoftDeletes;
    use HasFactory;

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s'
    ];

    public function getCreatedAtAttribute($date)
    {
        if (Carbon::now() > Carbon::parse($date)->addDays(15)) {
            return Carbon::parse($date);
        }
        return Carbon::parse($date)->diffForHumans();
    }

    protected $dateFormat='';

    protected $fillable = [
      'topic_id','article_id','content','user_id','ip','address'
    ];

    public function user()
    {
        return $this->hasOne(User::class,'id','user_id')
            ->select(['id','avatar','name']);
    }

    public function article()
    {
        return $this->hasOne(Articles::class,'id','article_id');
    }


    public function childs()
    {
        return $this->hasMany(Topics::class,'topic_id','id')->with('user');
    }

}
