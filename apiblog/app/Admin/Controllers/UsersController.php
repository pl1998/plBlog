<?php
/**
 * Created By PhpStorm.
 * User : Latent
 * Date : 2021/3/27
 * Time : 8:25 下午
 **/

namespace App\Admin\Controllers;


use App\Models\User;
use Dcat\Admin\Grid;
use Dcat\Admin\Http\Controllers\AdminController;

class UsersController extends AdminController
{

    public $title = '授权用户';
    public function grid()
    {
        return Grid::make(User::query()->orderByDesc('created_at'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('email');
//            $grid->column('avatar')->image();
            $grid->column('bound_oauth','登录类型')->using([
                ''=>'账号登录',
                0=>'微博',
                1=>'github',
                2=>'gitee',
            ]);

//            $grid->column('user_json');
            $grid->column('created_at');
            $grid->disableDeleteButton();
            $grid->disableCreateButton();
            $grid->disableEditButton();
            $grid->disableViewButton();

        });
    }
}
