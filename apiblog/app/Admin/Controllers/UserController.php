<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class UserController extends AdminController
{

    protected $title = '用户';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
            return Grid::make(\App\Models\User::query()->orderByDesc('created_at'), function (Grid $grid) {
                $grid->column('id')->sortable();
                $grid->column('name');
                $grid->column('email');
                $grid->column('avatar')->image()->width(50);
                $grid->column('bound_oauth','登录类型')->using([
                    ''=>'账号登录',
                    0=>'微博',
                    1=>'github',
                    2=>'gitee',
                ]);
                $grid->column('created_at');

                $grid->disableBatchActions(false);
                $grid->disableCreateButton()->disableDeleteButton()->disableViewButton();
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new User(), function (Form $form) {
            $form->display('id');
            $form->text('oauth_id');
            $form->text('name');
            $form->text('email');
            $form->image('avatar')->disk('public');
            $form->select('bound_oauth')->options([
                ''=>'账号登录',
                0=>'微博',
                1=>'github',
                2=>'gitee',
            ]);
            $form->select('status')->options([
                0=>'正常',
                1=>'禁用'
            ]);
            $form->display('created_at');
            $form->display('updated_at');
            $form->disableDeleteButton();
            $form->disableViewButton();
        });
    }
}
