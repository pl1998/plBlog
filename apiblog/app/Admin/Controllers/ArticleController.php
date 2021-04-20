<?php

namespace App\Admin\Controllers;

use App\Models\Articles;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;



class ArticleController extends AdminController
{

    protected $title = '文章列表';

    protected $label = [

    ];


    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Articles::with('admin')->orderByDesc('created_at'), function (Grid $grid)  {

            $grid->column('admin.name');
            $grid->column('id')->sortable();
            $grid->column('title');
            $grid->column('cover_img')->image();

            $grid->column('status')->switch();

            $grid->column('review_count');
            $grid->column('browse_count');
            $grid->column('label')->display(function ($label){
               $label =  explode(',',$label);
               foreach ($label as $value){
                   return "<span class='btn btn-xs btn-danger'>$value</span>";
               }
            });
            $grid->column('slug');
            $grid->column('stick')->switch();
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
        return Show::make($id, new Articles(), function (Show $show) {
            $show->field('id');
            $show->field('title');
            $show->field('cover_img');
            $show->field('description');
            $show->field('status')->using([
                0=>'正常',
                1=>'关闭'
            ]);
            $show->field('review_count');
            $show->field('browse_count');
            $show->field('label');
            $show->field('slug');
            $show->field('weight','权重');
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
        return Form::make(new Articles(), function (Form $form) {
            $form->display('id');
            $form->text('title')->required();
            $form->image('cover_img')->disk('public')->required();
            $form->textarea('description')->required();
            $form->markdown('content')->disk('public')->required();
            $form->switch('status')->options([
                0=>'正常',
                1=>'关闭'
            ]);
            $form->text('label');
            $form->text('slug');
            $form->switch('weight');

            $form->display('created_at');
            $form->display('updated_at');
            $form->saving(function (){

            });
        });
    }
}
