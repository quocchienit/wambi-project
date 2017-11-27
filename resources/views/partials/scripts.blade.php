<!-- jQuery  -->
<script src="{{url('')}}/assets/js/jquery.min.js"></script>
<script src="{{url('')}}/assets/js/bootstrap.min.js"></script>
<script src="{{url('')}}/assets/js/detect.js"></script>
<script src="{{url('')}}/assets/js/fastclick.js"></script>
<script src="{{url('assets/js/salvattore.min.js')}}"></script>

<script src="{{url('')}}/assets/js/jquery.slimscroll.js"></script>
<script src="{{url('')}}/assets/js/jquery.blockUI.js"></script>
<script src="{{url('')}}/assets/js/waves.js"></script>
<script src="{{url('')}}/assets/js/wow.min.js"></script>
<script src="{{url('')}}/assets/js/jquery.nicescroll.js"></script>
<script src="{{url('')}}/assets/js/jquery.scrollTo.min.js"></script>

<script src="{{url('')}}/assets/plugins/peity/jquery.peity.min.js"></script>
<script src="{{url('')}}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

<!-- jQuery  -->
<script src="{{url('')}}/assets/plugins/waypoints/lib/jquery.waypoints.js"></script>
<script src="{{url('')}}/assets/plugins/counterup/jquery.counterup.min.js"></script>

<script src="{{url('')}}/assets/plugins/morris/morris.min.js"></script>
<script src="{{url('')}}/assets/plugins/raphael/raphael-min.js"></script>

<script src="{{url('')}}/assets/plugins/jquery-knob/jquery.knob.js"></script>

{{-- <script src="{{url('')}}/assets/pages/jquery.dashboard.js"></script> --}}
<script src="{{url("assets/plugins/switchery/dist/switchery.min.js")}}"></script>
<script src="{{url('')}}/assets/js/jquery.core.js"></script>
<script src="{{url('')}}/assets/js/jquery.app.js"></script>

<!-- EASY PIE CHART JS -->
<script src="{{url('')}}/assets/plugins/jquery.easy-pie-chart/dist/easypiechart.min.js"></script>
<script src="{{url('')}}/assets/plugins/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
<script src="{{url('')}}/assets/pages/easy-pie-chart.init.js"></script>
<!--chartist Chart-->
<script src="{{url('')}}/assets/plugins/chartist/dist/chartist.min.js"></script>
<script src="{{url('')}}/assets/plugins/chartist/js/chartist-plugin-tooltip.min.js"></script>
{{-- <script src="{{url('')}}/assets/pages/jquery.chartist.init.js"></script> --}}
<!-- Datatable js -->
<script src="{{url('')}}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.bootstrap.js"></script>

<script src="{{url('')}}/assets/plugins/datatables/dataTables.buttons.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/buttons.bootstrap.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/jszip.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/pdfmake.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/vfs_fonts.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/buttons.html5.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/buttons.print.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.fixedHeader.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.keyTable.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.responsive.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/responsive.bootstrap.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.scroller.min.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.colVis.js"></script>
<script src="{{url('')}}/assets/plugins/datatables/dataTables.fixedColumns.min.js"></script>
{{-- editable table --}}
<script src="{{url('')}}/assets/plugins/jquery-datatables-editable/jquery.dataTables.js"></script>
<!--Summernote js-->
<script src="{{url('')}}/assets/plugins/summernote/summernote.min.js"></script>

<!-- Parsly js -->
<script type="text/javascript" src="{{url('')}}/assets/plugins/parsleyjs/parsley.min.js"></script>
{{-- multiselect --}}
<script type="text/javascript" src="{{url('')}}/assets/plugins/multiselect/js/jquery.multi-select.js"></script>
<script src="{{url('')}}/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js" type="text/javascript"></script>
<script src="{{url('')}}/assets/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>

{{-- select 2 --}}
<script src="{{url('')}}/assets/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>

<!-- datetimepicker  -->
<!-- Sweet-Alert  -->
<script src="{{url('')}}/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>	
<script src="{{url('')}}/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
<script src="{{url('')}}/assets/plugins/clockpicker/js/bootstrap-clockpicker.min.js"></script>

<!-- Sweet-Alert  -->
<script src="{{url('')}}/assets/plugins/bootstrap-sweetalert/sweet-alert.min.js"></script>
<script src="{{url('')}}/assets/pages/jquery.sweet-alert.init.js"></script>
<script src="{{url('')}}/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<script src="{{url('')}}/assets/plugins/password-meter/jquery.strengthify.js"></script>
<script src="{{url('')}}/assets/js/scripts.js" type="text/javascript"></script>
@if(isset($config) && $config == 1)
<script src="{{url('')}}/assets/plugins/sweetalert/dist/sweetalert2.min.js"></script>
<script src="{{url('')}}/assets/js/config_scripts.js?ver=1.0.0" type="text/javascript"></script>
@endif
@if(isset($survey) && $survey == 1)
<script src="{{url('')}}/assets/plugins/sweetalert/dist/sweetalert2.min.js"></script>
<script src="{{url('')}}/assets/js/scripts_exit.js" type="text/javascript"></script>
@endif
@if(isset($dd_config) && $dd_config == 1)
    <script src="{{url('')}}/assets/plugins/sweetalert/dist/sweetalert2.min.js"></script>
    <script src="{{url('')}}/assets/js/config_scripts.js" type="text/javascript"></script>
@endif
@if(isset($script_patient) && $script_patient == 1)
<script src="{{url('')}}/assets/js/script_patient.js" type="text/javascript"></script>
@endif
{{-- --}}
    <script src="//cdnjs.cloudflare.com/ajax/libs/x-editable/1.5.0/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
<!-- TouchSpin -->
<script src ="{{url('')}}/assets/plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>

<script>
    jQuery(document).ready(function() {
        jQuery('.timepicker').timepicker({
            defaultTIme: false
        });
    });
</script>