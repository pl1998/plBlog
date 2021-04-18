<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\WebsiteFooter;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class WebsiteFooterController extends AdminController
{
    protected $title ='网址信息';

    protected static $status=[
        0=>'正常',
        1=>'禁用'
    ];
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new WebsiteFooter(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('logo')->image();
            $grid->column('name','标题');
            $grid->column('license');
            $grid->column('license_url');
//            $grid->column('website');
            $grid->column('status')->select(static::$status);
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->filter(function (Grid\Filter $filter) {
                $filter->equal('id');

            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     *
     * @return Show
     */
    protected function detail($id)
    {
        return Show::make($id, new WebsiteFooter(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('logo');
            $show->field('license');
            $show->field('license_url');
            $show->field('website');
            $show->field('status');
            $show->field('created_at');
            $show->field('updated_at');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new WebsiteFooter(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->image('logo')->disk('public')->required();
            $form->text('license','备案/许可证编号')->required();
            $form->text('license_url')->required();

            //赣ICP备19000975号-1 //https://www.miit.gov.cn/
            $form->table('website', function ($table) {
                $table->text('title');
                $table->image('website_img')->disk('public');
                $table->text('website_url');
            })->saving(function ($v) {
                return json_encode($v);
            });
            $form->select('status')->options(static::$status)->default(0);

            $form->display('created_at');
            $form->display('updated_at');

            $form->saving(function (Form $form){
                if($form->isEditing() && $form->status==1){
                    //清除缓存
                    cache()->delete('get_website_info');
                }
            });
        });
    }
}
