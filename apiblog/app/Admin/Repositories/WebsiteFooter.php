<?php

namespace App\Admin\Repositories;

use App\Models\WebsiteFooter as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class WebsiteFooter extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
