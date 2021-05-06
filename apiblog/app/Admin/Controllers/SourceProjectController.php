<?php

namespace App\Admin\Controllers;

use App\Admin\Repositories\SourceProject;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class SourceProjectController extends AdminController
{
    protected $title ='开源项目';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(new SourceProject(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('describe');
            $grid->column('status')->switch();
            $grid->column('github')->link();
            $grid->column('tag','标签');
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
        return Show::make($id, new SourceProject(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('describe');
            $show->field('status');
            $show->field('github');
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
        return Form::make(new SourceProject(), function (Form $form) {
            $form->display('id');
            $form->text('title')->required();
            $form->markdown('describe')->disk('public')->required();
            $form->switch('status')->options([
                0=>'正常',
                1=>'关闭'
            ])->default(0);
            $form->text('github')->required();
            $form->text('tag')->required();

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
