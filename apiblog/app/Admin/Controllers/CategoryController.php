<?php

namespace App\Admin\Controllers;

use App\Models\Category;
use Dcat\Admin\Form;
use Dcat\Admin\Grid;
use Dcat\Admin\Show;
use Dcat\Admin\Http\Controllers\AdminController;

class CategoryController extends AdminController
{
    protected $title = '分类(只支持二级分类)';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Grid::make(Category::query(), function (Grid $grid) {
            $grid->column('id')->sortable();
            $grid->column('name');
            $grid->column('p_id', '父级分类')->display(function ($value){
                if($value==0){
                    return "顶级分类";
                }else{
                   return Category::where('id',$value)->value('name');
                }
            });
            $grid->column('status','状态')->using([
                0=>'正常',
                1=>'禁用'
            ]);
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
        return Show::make($id, new Category(), function (Show $show) {
            $show->field('id');
            $show->field('name');
            $show->field('p_id');
            $show->field('status');
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Form::make(new Category(), function (Form $form) {
            $form->display('id');
            $form->text('name')->required();
            $form->select('p_id')->options($this->getList())->required();
            $form->switch('status','状态')->options([
                1 => '禁用',
                0 => '正常',
            ])->default(0);
        });
    }

    protected function getList()
    {
        $list = Category::get()->toArray();
        $array = [];
        foreach ($list as $val){
            $array[$val['id']]=$val['name'];
        }
        $array[0]='顶级';
        return $array;
    }
}
