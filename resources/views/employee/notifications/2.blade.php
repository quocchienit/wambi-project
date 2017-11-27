<?php
$notification = str_replace('#pecks',$element->total,$element->display_name);
$notification = str_replace('#award',$notification);
?>
{{ $notification}}