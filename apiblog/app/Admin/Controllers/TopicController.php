<?php

namespace App\Admin\Controllers;

use App\Models\Topics;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class TopicController extends AdminController
{
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Topics::with(['user','article'])->orderByDesc('created_at'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('article.title');
            $grid->column('topic_id')->display(function ($value){
                if($value==0){
                    return "主评";
                }else{
                    return "副评";
                }
            });
            $grid->column('user.email');
            $grid->column('user.name');

            $grid->column('address');
            $grid->column('ip');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->disableEditButton()
                ->disableCreateButton()
                ->disableViewButton()
                ->renderCreateButton();
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
        return Show::make($id, Topics::with(['user','article']), function (Show $show) {
            $show->field('id');
            $show->field('article.title');
            $show->field('user.email');
            $show->field('user.name');
            $show->html('content');
            $show->field('address');
            $show->field('ip');
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
        return Form::make(new Topic(), function (Form $form) {
            $form->display('id');
            $form->text('article_id');
            $form->text('topic_id');
            $form->text('user_id');
            $form->text('content');
            $form->text('address');
            $form->text('ip');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
