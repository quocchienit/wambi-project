<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateShiftMasterTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('shift_master', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('shift_unit')->nullable();
			$table->string('shift_discipline')->nullable();
			$table->string('shift_job_title')->nullable();
			$table->string('shift_date')->nullable();
			$table->string('shift_time')->nullable();
			$table->string('shift_pecks')->nullable();
			$table->string('shift_notes')->nullable();
			$table->string('status')->nullable();
			$table->integer('employee_id')->nullable();
			$table->integer('user_id')->nullable();
			$table->timestamps();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('shift_master');
	}

}
