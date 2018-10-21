<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->increments('id')->comment('ID');
            $table->string('name')->comment('栏目名称');
            $table->unsignedInteger('parent_id')->nullable()->comment('父类目ID');
            $table->foreign('parent_id')->references('id')->on('categories')->onDelete('cascade');
            $table->boolean('is_directory')->comment('是否拥有子类目');
            $table->unsignedInteger('level')->comment('当前类目层级');
            $table->string('path')->comment('该类目所有父类目ID');
            $table->timestamp('created_at')->nullable()->comment('创建时间');
            $table->timestamp('updated_at')->nullable()->comment('修改时间');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('categories');
    }
}
