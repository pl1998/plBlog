<?php


use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//jwt auth
Route::group([
    'prefix' => 'auth'
], function ($router) {
    Route::post('login', 'AuthController@login');
    Route::get('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::get('me', 'AuthController@me');
});



Route::get('/article','ArticlesController@index');
Route::get('/article/{id}','ArticlesController@show')->middleware('access.record');
Route::get('/ho_list','ArticlesController@hotList');
Route::get('/article_archive','ArticlesController@ArticleArchive');
Route::get('/topic/{id}','TopicsController@index');

//权限校验路由
Route::post('/topic','TopicsController@store');
Route::delete('/topic/{id}','TopicsController@delete');

//第三方登录
Route::get('/githubCallBack','OauthController@githubCallBack');
Route::get('/giteeCallBack','OauthController@giteeCallBack');
Route::get('/weiboCallBack','OauthController@weiboCallBack');





