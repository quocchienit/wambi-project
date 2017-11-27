<!DOCTYPE html>
<html>
<?php $current_fac = \Session::get('current_fac'); ?>
    @include('partials.head')
    <body class="backend {{ Config::get('css.'.Auth::user()->type()) }}">
        {{--<div id="loader-wrapper">--}}
          {{--<div id="loader"></div>--}}
          {{--<div class="loader-section section-left"></div>--}}
          {{--<div class="loader-section section-right"></div>--}}
        {{--</div>--}}

        @include('partials.navigationbar',['notifications'=>Auth::user()->get_notifications(),'total_notifications'=>Auth::user()->total_notifications(),'notifications_photo'=>Auth::user()->notifications_photo(), 'notifications_photo_date' =>Auth::user()->notifications_photo_date()])
        <div class="wrapper">
            <div class="container">
                @yield('content')
                @include('partials.footer')
            </div>
        </div>
        @include('partials.scripts')

        <script type="text/javascript">
            var htmlUnits = '<div class =" text-center">Select the Unit(s) from the list that you would like these changes to apply to:</div>'+
                                            '<div style =" width: 60%;margin:auto;">';
              @if((\Cache::get('function_amada') != 1) || (\Cache::get('function_amada') == 1 && \Auth::user()->type() != 'super-admin'))
              htmlUnits = htmlUnits +
                '<div class="checkbox checkbox-custom checkbox-circle"  style ="text-align: left">' +
                '<input id = "all" type="checkbox" value="all" class ="survey-check">' + 
                  '<label>All</label>' +
                  '</div>';
               htmlUnits = htmlUnits +
                '<div class="text-center">' +
                  'OR'+
                  '</div>';
              @endif
                 
            var count = 0;
            var index = 1;
            @if(isset($units)){
              count = {{ count($units) }};
              @foreach ($units as $item)
                htmlUnits = htmlUnits +
                '<div class="checkbox checkbox-custom checkbox-circle"  style ="text-align: left">' +
                '<input id = "{{ $item->key }}" type="checkbox" value="{{ $item->key }}" class ="survey-check ' + index.toString() + '">' + 
                  '<label>{{ $item->value}}</label>' +
                  '</div>';
                  index++;
              @endforeach
            }
            @endif
            
            htmlUnits = htmlUnits + '</div>';


             var htmlUnits_create_award_types = '<div class =" text-center">Select the Unit(s) from the list that you would like these changes to apply to:</div>'+
                                            '<div style =" width: 60%;margin:auto;">';
              @if((\Cache::get('function_amada') != 1) || (\Cache::get('function_amada') == 1 && \Auth::user()->type() != 'super-admin'))
              htmlUnits_create_award_types = htmlUnits_create_award_types +
                '<div class="checkbox checkbox-custom checkbox-circle"  style ="text-align: left">' +
                '<input id = "all" type="checkbox" value="all" class ="survey-check">' + 
                  '<label>All</label>' +
                  '</div>';
               htmlUnits_create_award_types = htmlUnits_create_award_types +
                '<div class="text-center">' +
                  'OR'+
                  '</div>';
              @endif
                 
            var count = 0;
            var index = 1;
            @if(isset($units)){
              count = {{ count($units) }};
              @foreach ($units as $item)
              @if( $item->refkey ==  $current_fac || $current_fac == 0)
                htmlUnits_create_award_types = htmlUnits_create_award_types +
                '<div class="checkbox checkbox-custom checkbox-circle"  style ="text-align: left">' +
                '<input id = "{{ $item->key }}" type="checkbox" value="{{ $item->key }}" class ="survey-check ' + index.toString() + '">' + 
                  '<label>{{ $item->value}}</label>' +
                  '</div>';
                  index++;
                @endif
              @endforeach
            }
            @endif
            
            htmlUnits_create_award_types = htmlUnits_create_award_types + '</div>';
            
            jQuery(document).ready(function($) {
                $(document).on('change','.survey-check',function(){
                  var unit_value = $(this).val();
                  if(unit_value == 'all'){
                    $(".survey-check").not(this).prop('checked',false);
                  }
                  else{
                    $('#all').prop('checked',false);
                  }
                });
                $.ajaxSetup({
                  headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                  }
                });
                /* ajax delete */
                $(".ajax-delete").on('submit',function(){
                  var _ = $(this);
                  swal({
                      title: "Are you sure you want to delete?",
                      text: "You will not be able to recover this!",
                      type: "error",
                      showCancelButton: true,
                      confirmButtonClass: 'btn-danger',
                      confirmButtonText: "Yes, delete it!",
                      closeOnConfirm: false
                  }, function () {
                    $.ajax({
                      url: _.attr('action'),
                      type: 'post',
                      dataType: 'json',
                      data: _.serialize(),
                    })
                    .done(function(response) {
                      if(response.success){
                        _.closest('tr').fadeOut('slow',function(){
                          swal("Deleted!", response.message, "success");
                        });
                      }
                    }) 
                    .fail(function(){
                        swal("Error!", "Problem when processing request", "error");
                    })                   
                  });                                      
                  return false;
                })

                // send access code
                $(".ajax-send").on('submit',function(){
                  var _ = $(this);
                  swal({
                      title: "Are you sure you want to send access code?",
                      text: "You will not be able to recover this!",
                      type: "info",
                      showCancelButton: true,
                      confirmButtonClass: 'btn-info',
                      confirmButtonText: "OK",
                      closeOnConfirm: false
                  }, function () {
                    $.ajax({
                      url: _.attr('action'),
                      type: 'post',
                      dataType: 'json',
                      data: _.serialize(),
                    })
                    .done(function(response) {
                      if(response.success){                        
                          swal("Send Access Code Success!", response.message, "success");                        
                      }
                    }) 
                    .fail(function(){
                        swal("Error!", "Problem when processing request", "error");
                    })                   
                  });                                      
                  return false;
                })

                $(".select2").select2();
                /* employee ajax select 2 search */
                function formatRepo (repo) {
                  if (repo.loading) return repo.text;
                  if(!repo.image)
                      repo.image = "avatar-1.jpg";

                  var markup = 
                  "<div class='select2-result-repository clearfix'>" +
                    "<div class='select2-result-repository__avatar'>"+
                      "<img class='thumb-lg' src='{{ url('') }}/uploads/profiles/" + repo.image + "' />"+
                    "</div>" +
                    "<div class='select2-result-repository__meta'>" +
                      "<div class='select2-result-repository__title'>" + repo.firstname + " "+repo.lastname+ "</div>"+
                      // "<div class='select2-result-repository__statistics'>" +
                        // "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> " + repo.forks_count + " Forks</div>" +
                        // "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> " + repo.stargazers_count + " Stars</div>" +
                        // "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> " + repo.watchers_count + " Watchers</div>" +
                      "</div>" +
                    "</div>"+
                  "</div>";

                  return markup;
                }

                function formatRepoSelection (repo) {
                  var name='';
                  if(repo.firstname)
                    name+=repo.firstname;
                  if(repo.lastname)
                    name+=" "+repo.lastname;
                  return name|| repo.text;
                }  
                $('.employee_ajax_search').select2({
                  ajax: {
                    url: "{{ route('admin::employee::search') }}",
                    dataType: 'json',
                    type:'post',
                    delay: 250,
                    data: function (params) {
                      return {
                        q: params.term, // search term
                        page: params.page
                      };
                    },
                    processResults: function (data, params) {
                      // parse the results into the format expected by Select2
                      // since we are using custom formatting functions we do not need to
                      // alter the remote JSON data, except to indicate that infinite
                      // scrolling can be used
                      params.page = params.page || 1;

                      return {
                        results: data.items,
                        pagination: {
                          more: (params.page * 30) < data.total_count
                        }
                      };
                    },
                    cache: true
                  },
                  escapeMarkup: function (markup) { return markup; },
                  minimumInputLength: 1,
                  templateResult: formatRepo,
                  templateSelection: formatRepoSelection
                });
                /* ajax employee select2 search */
                $('.datepicker-autoclose').datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  format: "mm/dd/yyyy",
                });
                $('form').parsley();
                $('.data-table').DataTable({'stateSave': true});
                $('.data-table-ajax').DataTable({
                  'stateSave': true,
                  "processing": true,
                  "serverSide": true,
                });
                $('.counter').counterUp({
                    delay: 100,
                    time: 1200
                });
                $(".knob").knob();
                @yield('page-script')
                $('body').toggleClass('loaded');
            });

            function readURL(input) {
                if (input.files && input.files[0]) {
                  var reader = new FileReader();

                  reader.onload = function (e) {
                      //$('#imgupload')
                          //.attr('src', e.target.result);
                      $('#image-crop').attr('src', e.target.result);
                      $('.cropper-canvas').children().attr('src', e.target.result);
                      $('.cropper-view-box').children().attr('src', e.target.result);                       
                  };

                  reader.readAsDataURL(input.files[0]);
                  }
                  $('#crop-employee').attr('style','');
                  $('#crop-setting').attr('style','margin-left: 4px;');
                  $('#resizeimg').click();
            }            
            
          @yield('page-script-selected')     
        </script>
        @stack('scripts')
        <script type="text/JavaScript">          
          $(document).ready(function() {              
              var table = $(".table").DataTable();
              table
                   .search( '' )
                   .columns().search( '' )
                   .draw();
              $('.dataTables_filter').find('input').val('');

          });
        </script>
        <script>          
            (function () {
              function getRoundedCanvas(sourceCanvas) {
                var canvas = document.createElement('canvas');
                var context = canvas.getContext('2d');
                var width = sourceCanvas.width;
                var height = sourceCanvas.height;

                canvas.width = width;
                canvas.height = height;

                context.imageSmoothingEnabled = true;
                context.drawImage(sourceCanvas, 0, 0, width, height);
                context.globalCompositeOperation = 'destination-in';
                context.beginPath();
                context.arc(width / 2, height / 2, Math.min(width, height) / 2, 0, 2 * Math.PI, true);
                context.fill();

                return canvas;
              }
              window.addEventListener('DOMContentLoaded', function () {
                var image = document.getElementById('image-crop');
                var button = document.getElementById('btnresult');
                var result = document.getElementById('result');
                var croppable = false;
                var btnIn = document.getElementById('zoomIn');
                var btnOut = document.getElementById('zoomOut');
                if(image){
                  $('#modal').on('shown.bs.modal', function () {
                      cropper = new Cropper(image, {
                    //    autoCropArea: 0.5,
                        aspectRatio: 1,
                        viewMode: 1,
                        ready: function () {

                          // Strict mode: set crop box data first
                          croppable = true;
                          //cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
                        }
                      });
                    }).on('hidden.bs.modal', function () {
                      cropBoxData = cropper.getCropBoxData();
                      canvasData = cropper.getCanvasData();
                      cropper.destroy();
                    });
                  //var cropper = new Cropper(image, {
                  //  //aspectRatio: 1,
                  //  aspectRatio: 1,
                  //  data: {
                  //    x: 420,
                  //    y: 50,
                  //    width: 640,
                  //    height: 360},
                  //  viewMode: 1,
                  //  ready: function () {
                  //    croppable = true;
                  //    $('#crop-employee').attr('style','display:none');
                  //  }
                  //});
                
                  button.onclick = function () {
                    var croppedCanvas;
                    var roundedCanvas;
                    var roundedImage;

                    if (!croppable) {
                      return;
                    }

                    // Crop
                    croppedCanvas = cropper.getCroppedCanvas();

                    // Round
                    roundedCanvas = getRoundedCanvas(croppedCanvas);

                    // Show
                    roundedImage = document.getElementById('imgupload');
                    roundedImage.src = roundedCanvas.toDataURL();          
                    result.innerHTML = '';
                    result.appendChild(roundedImage);
                    $('#employeeimg').val(roundedCanvas.toDataURL());
                    $('#modal').modal('hide');
                  };

                  btnIn.onclick = function () {          
                    if (!croppable) {
                      return;
                    }
                    cropper.zoom(-0.1);
                  };

                  btnOut.onclick = function () {          
                    if (!croppable) {
                      return;
                    }
                    cropper.zoom(0.1);
                  };
                }
              });
            })();
        </script>
        <script>
            $(window).load(function () {
                var status_pass = $('#status_pass').val();
                if (status_pass == 0) {
                    swal({
                        title: "Change your password!",
                        text: "Please click here to update your password",
                        type: "custom",
                        imageUrl: "{{url('assets/images/lock.gif')}}",
                        showCancelButton: false,
                        showConfirmButton: true,
                        cancelButtonClass: 'btn-primary btn-md waves-effect'
                    }, function (dismiss) {
                        if (dismiss == true) {
                            window.location.href = '{{url('changePassword')}}';
                        }
                    });
                }

//                $('.password-field-all').strengthify({
//                    zxcvbn: 'assets/plugins/password-meter/zxcvbn.js',
//                    drawTitles: true,
//                    drawMessage: true
//                });
            });
        </script>
    </body>
</html>