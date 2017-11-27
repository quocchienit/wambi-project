@extends('admin.layout');
@section('content')
<form action="" method="post" accept-charset="utf-8">
                {!! csrf_field() !!}            
	<fieldset class="form-group">
		<label for="exampleSelect1">Permistions</label>
		<select name = "role" class="form-control select2">
			@foreach ($roles as $element)
				<option value="{{ $element->id }}" {{ ($element->id==$role->id)?'selected':'' }}>{{ $element->name }}</option>
			@endforeach
		</select>
	</fieldset>
	<fieldset class="form-group">
		@foreach ($permissons as $element)
			<input name="permissons[]" {{ (in_array($element->name,$p))?'checked':'' }} type="checkbox" value="{{ $element->id }}">
			<label>{{ $element->name }}</label>
		@endforeach
	</fieldset>
	<button type="submit" class="btn btn-primary">Submit</button>
</form>
@stop