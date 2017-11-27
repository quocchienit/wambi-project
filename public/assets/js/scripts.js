function ajust_height(e1,e2){
    d1 = $(e1);
    d2 = $(e2);
    h = Math.max(d1.height(),d2.height());
    d1.height(h);
    d2.height(h);
}
/**
 * Theme: Ubold Admin Template
 * Author: Coderthemes
 * Component: Editable
 *
 */

 jQuery(document).ready(function ($) {
    /* ajax delete */
    $(".ajax-delete2").on('submit',function(){
        var _ = $(this);
        swal({
            title: "Are you sure you want to delete?",
            text: "You will not be able to recover this!",
            type: "error",
            showCancelButton: true,
            confirmButtonClass: 'btn-danger',
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
        },function () {
            $.ajax({
                url: _.attr('action'),
                type: 'post',
                dataType: 'json',
                data: _.serialize(),
            })
            .done(function(response) {
                if(response.success){
                    _.closest('.item-wrapper').fadeOut('slow',function(){
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

    $('.selectpicker').selectpicker();
    var summernote = $('.summernote').summernote({
        height: 250,                 // set editor height
        minHeight: null,             // set minimum height of editor
        maxHeight: null,             // set maximum height of editor
        focus: false,                // set focus to editable area after initializing summernote
        callbacks: {
            onImageUpload: function (files) {
                // upload image to server and create imgNode...
                // summernote.summernote('insertNode', imgNode);
                data = new FormData();
                data.append("image", files[0]);
                $.ajax({
                    url: "/media/upload/news",
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    type: 'POST',
                    success: function (data) {
                        if (data.success)
                            $('.summernote').summernote("insertImage", data.url);
                        else
                            alert(data.message);
                    }
                })
            }
        }
    });

    $('.inline-editor').summernote({
        airMode: true
    });

    $('.colorpicker-rgba').colorpicker();
    // $('#single-input').clockpicker({
    //     placement: 'bottom',
    //     align: 'left',
    //     autoclose: true,
    //     'default': 'now'
    // });
    // $('#check-minutes').click(function(e){
    //     // Have to stop propagation here
    //     e.stopPropagation();
    //     $("#single-input").clockpicker('show')
    //     .clockpicker('toggleView', 'minutes');
    // });  

});