<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateSurveysTable extends Migration {

	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('surveys', function(Blueprint $table)
		{
			$table->integer('id', true);
			$table->integer('patient_id');
			$table->integer('employee_id');
			$table->integer('discipline')->nullable();
			$table->integer('unit_id')->nullable();
			$table->integer('total')->nullable()->default(0);
			$table->string('type');
			$table->integer('avg')->nullable()->default(0);
			$table->timestamps();
			$table->decimal('avg_rating', 11, 0)->nullable();
		});
	}


	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('surveys');
	}

}
