<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/23
 * Time : 10:59 上午
 **/

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use DateTimeInterface;

class Models extends Model
{
    protected function serializeDate(DateTimeInterface $date)
    {
        return $date->format($this->dateFormat ?: 'Y-m-d H:i:s');
    }
}
