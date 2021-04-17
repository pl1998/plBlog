<?php

namespace App\Admin\Controllers;

use App\Models\VisitorRegistry;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class VisitorRegistryController extends AdminController
{
    public $title = '监控日志';
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(VisitorRegistry::with('article')->orderByDesc('created_at'), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('article.title');
            $grid->column('ip');
            $grid->column('clicks');
            $grid->column('address');
            $grid->column('created_at');
            $grid->column('updated_at')->sortable();

            $grid->disableActions(false);
            $grid->disableBatchActions(false);
            $grid->disableFilter(false);

            $grid->filter(function (Grid\Filter $filter) {

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
        return Show::make($id, new VisitorRegistry(), function (Show $show) {
            $show->field('id');
            $show->field('art_id');
            $show->field('ip');
            $show->field('clicks');
            $show->field('address');
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
        return Form::make(new VisitorRegistry(), function (Form $form) {
            $form->display('id');
            $form->text('art_id');
            $form->text('ip');
            $form->text('clicks');
            $form->text('address');

            $form->display('created_at');
            $form->display('updated_at');
        });
    }
}
