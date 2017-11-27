<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class AddForeignKeysToCategoryTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::table('category', function(Blueprint $table)
		{
			$table->foreign('etid', 'category_ibfk_1')->references('id')->on('employee_type')->onUpdate('CASCADE')->onDelete('CASCADE');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::table('category', function(Blueprint $table)
		{
			$table->dropForeign('category_ibfk_1');
		});
	}

}
