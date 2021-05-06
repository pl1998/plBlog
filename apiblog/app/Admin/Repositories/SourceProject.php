<?php

namespace App\Admin\Repositories;

use App\Models\SourceProject as Model;
use Dcat\Admin\Repositories\EloquentRepository;

class SourceProject extends EloquentRepository
{
    /**
     * Model.
     *
     * @var string
     */
    protected $eloquentClass = Model::class;
}
