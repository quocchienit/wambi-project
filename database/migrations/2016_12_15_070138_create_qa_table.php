<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateQaTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('qa', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('qaid', 50);
			$table->text('question', 65535);
			$table->text('q_es', 65535)->nullable();
			$table->text('anwser', 65535)->nullable();
			$table->text('a_es', 65535)->nullable();
			$table->string('utype', 250);
			$table->string('created_user', 50);
			$table->timestamps();
			$table->string('updated_user', 50)->nullable()->default('');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('qa');
	}

}
