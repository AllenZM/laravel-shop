<?php
/**
 * Name: 用户控制器.
 * User: 董坤鸿
 * Date: 2018/6/26
 * Time: 下午3:12
 */

namespace App\Admin\Controllers;

use App\Models\User;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class UsersController extends Controller
{
    use ModelForm;

    /**
     * 用户列表
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('用户');
            $content->description('列表');
            $content->body($this->grid());
        });
    }

    /**
     * 编辑用户
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('用户');
            $content->description('编辑');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * 创建用户
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('用户');
            $content->description('创建');

            $content->body($this->form());
        });
    }

    /**
     * 生成器
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        // 根据回调函数，在页面上表格的形式展示用户记录
        return Admin::grid(User::class, function (Grid $grid) {
            // 创建一个列表为 ID 的列，内容是用户的 id 字段，并且可以在点断页面点击排序
            $grid->id('ID')->sortable();
            // 创建一个列表为 用户名 的列，内容是用户的 name 字段。下面的 email() 和 created_at() 同理
            $grid->name('用户名');
            $grid->email('邮箱');

            $grid->email_verified('验证邮箱')->display(function ($value) {
                return $value ? '是' : '否';
            });

            $grid->created_at('注册时间');
            $grid->updated_at('修改时间');

            //不在页面显示 `新建` 按钮，因为我们不需要在后台新建用户
            $grid->disableCreateButton();

            $grid->actions(function ($actions) {
                // 不在每行后面展示删除按钮
                $actions->disableDelete();

                // 不在每一行后面展示编辑按钮
                $actions->disableEdit();
            });
        });
    }

    /**
     * 表单生成器
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(User::class, function (Form $form) {

            $form->display('id', 'ID');

            $form->display('created_at', 'Created At');
            $form->display('updated_at', 'Updated At');
        });
    }
}
