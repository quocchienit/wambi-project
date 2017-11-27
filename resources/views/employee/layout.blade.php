<!DOCTYPE html>
<html>
    @include('partials.head')
    <body class="employee">
        <div id="loader-wrapper">
          <div id="loader"></div>       
          <div class="loader-section section-left"></div>
          <div class="loader-section section-right"></div>
        </div>
        @include('partials.navigationbar',[
            'notifications'=>Auth::user()->get_notifications(),
            'total_notifications'=>Auth::user()->total_notifications()
        ])
        <div class="wrapper">
            <div class="container">
                @yield('content')
                @include('partials.footer', ['some' => 'data'])
            </div>
        </div>
        @include('partials.scripts')

        <script type="text/javascript">

            jQuery(document).ready(function($) {
                $.ajaxSetup({
                  headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                  }
                });

                $(".select2").select2();
                $('.datepicker-autoclose').datepicker({
                  autoclose: true,
                  todayHighlight: true,
                  format: "mm-dd-yyyy",
                });
                $('form').parsley();
                $('.data-table').DataTable({'stateSave': true});
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
                    //    .attr('src', e.target.result)
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
        </script>
        @stack('scripts')
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
                        imageUrl: "assets/images/lock.gif",
                        showCancelButton: false,
                        showConfirmButton: true,
                        cancelButtonClass: 'btn-primary btn-md waves-effect'
                    }, function (dismiss) {
                        if (dismiss == true) {
                            window.location.href = 'changePassword';
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