<?php

namespace App\Models;

use Dcat\Admin\Models\Administrator;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Articles extends Models
{
    use HasFactory;

    public function getLabelAttribute($key)
    {
        $label =  explode(',',$key);
        return $label[0];
    }

    public function admin()
    {
        return $this->hasOne(Administrator::class,'id','user_id');
    }


    public function topic()
    {
        return $this->hasMany(Administrator::class,'id','user_id');
    }

    public function getCoverImgAttribute($key)
    {
        if(strstr($key,'http')==false){
            if(env('DISK')=='qiniu'){
                return  env('QINIU_DOMAIN').'/'.$key;
            }else{
                return  env('APP_URL').'/storage/'.$key;
            }
        }
        return  $key;
    }

    public function category()
    {
        return $this->hasOne(Category::class,'category_id','id');
    }
}
