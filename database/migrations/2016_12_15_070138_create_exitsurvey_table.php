<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExitsurveyTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('exitsurvey', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('pid');
			$table->integer('q1');
			$table->integer('q2');
			$table->integer('q3');
			$table->integer('q4');
			$table->integer('q5');
			$table->integer('q6');
			$table->integer('q7');
			$table->integer('q8');
			$table->integer('q9');
			$table->integer('q10');
			$table->integer('q11');
			$table->integer('q12');
			$table->integer('q13');
			$table->integer('q14');
			$table->integer('q15');
			$table->integer('q16');
			$table->integer('q17');
			$table->string('type', 250);
			$table->dateTime('date');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('exitsurvey');
	}

}
