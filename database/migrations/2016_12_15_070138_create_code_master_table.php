<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCodeMasterTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('code_master', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->string('type', 250)->nullable();
			$table->string('key', 250)->nullable();
			$table->string('value', 250)->nullable();
			$table->string('notes', 2000)->nullable();
			$table->string('display_name', 500)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('code_master');
	}

}
