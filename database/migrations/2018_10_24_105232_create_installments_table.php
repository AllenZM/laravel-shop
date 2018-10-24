<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInstallmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('installments', function (Blueprint $table) {
            $table->increments('id')->comment('ID');
            $table->string('no')->uniquer()->comment('分期流水号');
            $table->unsignedInteger('user_id')->comment('用户ID');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->unsignedInteger('order_id')->comment('订单ID');
            $table->foreign('order_id')->references('id')->on('orders')->onDelete('cascade');
            $table->decimal('total_amount')->comment('总本金');
            $table->unsignedInteger('count')->comment('还款期数');
            $table->float('fee_rate')->comment('手续费率');
            $table->float('fine_rate')->comment('逾期费率');
            $table->string('status')->default(\App\Models\Installment::STATUS_PENDING)->comment('还款状态');
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
        Schema::dropIfExists('installments');
    }
}
