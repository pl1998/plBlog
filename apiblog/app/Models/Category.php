<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	use HasDateTimeFormatter;
    public $timestamps = false;

//    public function pid(){
//        return $this->hasOne(Category::class,'id','p_id');
//
//    }

     public function articles()
     {
         return $this->hasMany(Articles::class,'category_id','id');
     }
}
