<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class VisitorRegistry extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'visitor_registries';

    public function article()
    {
        return $this->hasOne(Articles::class,'id','art_id');
    }

    protected $fillable = [
      'art_id','address','ip'
    ];
}
