<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateExitQuestionTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('exit_question', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('qid');
			$table->integer('type');
			$table->string('question', 250);
			$table->boolean('enabled')->default(1);
			$table->integer('unit_id')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('exit_question');
	}

}
