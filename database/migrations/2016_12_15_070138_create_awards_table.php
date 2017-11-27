<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAwardsTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('awards', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('user_id');
			$table->integer('owner')->index('eid');
			$table->text('owner_name', 65535)->nullable();
			$table->integer('peck')->nullable();
			$table->integer('redemcoin')->nullable();
			$table->integer('balancecoin')->nullable();
			$table->dateTime('date_created')->nullable();
			$table->string('enterytype', 250)->nullable();
			$table->string('approval', 10);
			$table->string('note', 1000)->nullable();
			$table->string('type');
			$table->integer('period')->nullable()->default(1);
			$table->integer('award');
			$table->string('status')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('awards');
	}

}
