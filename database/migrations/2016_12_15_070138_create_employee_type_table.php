<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeTypeTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('employee_type', function(Blueprint $table)
		{
			$table->integer('id')->index('etid_2');
			$table->string('type', 50);
			$table->string('name', 250);
			$table->string('icon', 250);
			$table->string('permission', 1000);
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('employee_type');
	}

}
