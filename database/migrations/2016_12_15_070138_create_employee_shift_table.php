<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeShiftTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('employee_shift', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('employee_id');
			$table->integer('shift_id')->nullable();
			$table->string('status', 250)->nullable();
			$table->timestamps();
			$table->string('approval', 3)->default('NO');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('employee_shift');
	}

}
