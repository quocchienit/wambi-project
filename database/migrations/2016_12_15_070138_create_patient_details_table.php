<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePatientDetailsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('patient_details', function(Blueprint $table)
		{
			$table->integer('pid', true);
			$table->integer('lid')->index('lid');
			$table->text('fname', 65535);
			$table->text('lname', 65535);
			$table->date('dob');
			$table->date('admitteddate');
			$table->date('release')->nullable();
			$table->string('outcome', 250);
			$table->integer('ssn')->unique('ssn');
			$table->integer('pinno')->index('pinno_2');
			$table->string('email', 100);
			$table->string('mobile', 100);
			$table->integer('insurance_id')->nullable();
			$table->string('code', 4)->nullable();
			$table->dateTime('code_date')->nullable();
			$table->string('patient_carrier', 250)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('patient_details');
	}

}
