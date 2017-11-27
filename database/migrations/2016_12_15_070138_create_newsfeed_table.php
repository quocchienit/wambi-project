<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateNewsfeedTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('newsfeed', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->text('content');
			$table->timestamps();
			$table->string('title', 100);
			$table->string('image')->nullable();
			$table->string('excerpt')->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('newsfeed');
	}

}
