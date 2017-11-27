<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateEmployeeMasterTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('employee_master', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('etid');
			$table->integer('clockid');
			$table->string('units', 1000)->nullable()->index('lid');
			$table->integer('catid')->nullable()->index('catid');
			$table->text('disciplines', 65535);
			$table->string('firstname', 250);
			$table->string('lastname', 250);
			$table->date('dob');
			$table->date('lastlogin');
			$table->date('hiredate');
			$table->string('address', 250);
			$table->string('shifts', 250);
			$table->string('email', 250);
			$table->string('mobile', 250);
			$table->string('image', 250);
			$table->string('password', 250);
			$table->integer('employeeid');
			$table->boolean('job');
			$table->string('carrier', 500)->nullable();
			$table->string('job_description', 500)->nullable();
			$table->string('remember_token')->nullable();
			$table->integer('pecks')->nullable()->default(0);
			$table->index(['etid','units'], 'etid');
			$table->index(['etid','units'], 'etid_2');
			$table->index(['etid','units'], 'etid_3');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('employee_master');
	}

}
