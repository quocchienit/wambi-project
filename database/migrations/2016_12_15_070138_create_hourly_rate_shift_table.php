<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateHourlyRateShiftTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('hourly_rate_shift', function(Blueprint $table)
		{
			$table->integer('shift_id');
			$table->integer('hourly_rate_id');
			$table->unique(['shift_id','hourly_rate_id'], 'unique');
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('hourly_rate_shift');
	}

}
