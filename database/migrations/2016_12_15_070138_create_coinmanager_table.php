<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCoinmanagerTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('coinmanager', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('employee_id')->nullable();
			$table->integer('applier_id')->nullable();
			$table->integer('amount')->nullable();
			$table->timestamps();
			$table->string('approval', 5)->nullable();
			$table->string('note')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('coinmanager');
	}

}
