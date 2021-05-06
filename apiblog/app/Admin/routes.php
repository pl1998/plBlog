<?php

use Illuminate\Routing\Router;
use Illuminate\Support\Facades\Route;
use Dcat\Admin\Admin;

Admin::routes();

Route::group([
    'prefix'     => config('admin.route.prefix'),
    'namespace'  => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('auth/{user}',function (){
        return redirect('/admin');//
    });
    $router->get('/', 'HomeController@index');

    $router->resource('/articles', 'ArticleController');

    $router->get('/users', 'UserController@index');
    $router->put('/users/{user}', 'UserController@update');
    $router->get('/users/{user}/edit', 'UserController@edit');

    $router->resource('/visitor-registry', 'VisitorRegistryController');
    $router->resource('/category', 'CategoryController');
    $router->resource('/topics', 'TopicController');
    $router->resource('/website', 'WebsiteFooterController');
    $router->resource('/source_project', 'SourceProjectController');

});


