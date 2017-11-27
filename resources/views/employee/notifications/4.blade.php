<?php
$notification = str_replace('#count',$element->count,$element->display_name);
$notification = str_replace('#jobtitle',$notification);
?>
{{ $notification }}