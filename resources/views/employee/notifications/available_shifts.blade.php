@if ($content)
	{{ $content or '' }} Available shift(s) for {{ \App\CodeMaster::get_code_by_type_and_key('job_title',$element->pivot->jobtitle_id) }}
@else
	Shift for {{ \App\CodeMaster::get_code_by_type_and_key('job_title',$element->pivot->jobtitle_id) }} has been filled.
@endif
