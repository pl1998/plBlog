<?php

namespace App\Admin\Repositories;

use App\Models\Topic as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class Topic extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
