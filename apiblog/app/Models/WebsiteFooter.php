<?php

namespace App\Models;

use Dcat\Admin\Traits\HasDateTimeFormatter;

use Illuminate\Database\Eloquent\Model;

class WebsiteFooter extends Model
{
	use HasDateTimeFormatter;
    protected $table = 'website_footer';

    public function getWebsiteAttribute($data)
    {
        return json_decode($data,true);
    }

}
