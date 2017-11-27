<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeNotificationTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('employee_notification', function(Blueprint $table)
		{
			$table->bigInteger('id', true);
			$table->integer('employee_id')->nullable();
			$table->integer('notification_id')->nullable();
			$table->string('content')->nullable();
			$table->timestamps();
			$table->string('status')->nullable()->default('NOT_SEEN');
			$table->integer('jobtitle_id')->nullable();
			$table->unique(['employee_id','jobtitle_id','notification_id'], 'd');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('employee_notification');
	}

}
