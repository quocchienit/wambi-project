<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAnswersTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('answers', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('qid');
			$table->integer('pid')->index('pid');
			$table->integer('eid')->index('eid');
			$table->integer('unit_id')->index('lid');
			$table->integer('catid');
			$table->integer('peck');
			$table->integer('incid')->index('incid');
			$table->integer('etid')->index('etid');
			$table->dateTime('date')->nullable();
			$table->string('user_type', 20)->nullable();
			$table->integer('survey_id')->nullable();
			$table->integer('answer_id');
			$table->index(['qid','pid','eid','unit_id'], 'qid');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('answers');
	}

}
