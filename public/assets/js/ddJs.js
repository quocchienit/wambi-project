$('.btn-step1-submit').click(function () {
   var caregiver_content = $('#caregiver_content').val();
   var to = $('#to').val();
   var from = $('#from').val();
   var address = $('#address').val();
   if(caregiver_content==0 || to==0){
       swal({
           title: "",
           text: "Please insert content and your name!",
           type: "error",
           showCancelButton: true,
           showConfirmButton: false,
           cancelButtonClass: 'btn-primary btn-md waves-effect'
       });
   }else{
       if(from){
           caregiver_content = caregiver_content.trim() + '. From, ' + from;
       }else{
           caregiver_content = caregiver_content.trim() + '. From, One Grateful Patient';
       }
       $.ajax({
           url: 'send-carepostcard',
           type: 'post',
           data: {
               caregiver_content: caregiver_content,
               to: to,
               from: from,
               address: address
           },
           success :  function(data) {
               console.log(data);
               // $('#tag_modal').modal('show');
               $('#email_modal').modal('show');
           }
       });
   }
});

$('#btn-submit-tag').click(function () {
    var tags = $('#select_tag').select2("val");
    if(tags && tags.length>0){
        $.ajax({
            method : 'POST',
            url  :  'add-tags',
            data : {
                tags: tags
            },
            success :  function(data) {
                // console.log(data);
                $('#tag_modal').modal('hide');
                $('#email_modal').modal('show');
            }
        });
    }else{
        swal({
            title: "",
            text: "Please select tag!",
            type: "error",
            showCancelButton: true,
            showConfirmButton: false,
            cancelButtonClass: 'btn-primary btn-md waves-effect'
        });
    }
});

$('#btnSave').click(function () {
    // var email = $('#email').val();
    var check = 0;
    if($('#accept-check').is(':checked')){
        check = 1;
    }
    // console.log(email);
    console.log(check);
    if(check==0){
        swal({
            title: "",
            text: "Please check I accept Terms and Conditions and have read the Privacy policy",
            type: "error",
            showCancelButton: true,
            showConfirmButton: false,
            cancelButtonClass: 'btn-primary btn-md waves-effect'
        });
        return;
    }
    // if(email==0){
    //     swal({
    //         title: "",
    //         text: "Please insert email!",
    //         type: "error",
    //         showCancelButton: true,
    //         showConfirmButton: false,
    //         cancelButtonClass: 'btn-primary btn-md waves-effect'
    //     });
    //     return;
    // }
    $("#buttonloading").css('display','inline-block');
    $("#button-check").css('display', 'none');
    html2canvas($("#contentLetter"), {
        onrendered: function(canvas) {
            var img = canvas.toDataURL();
            // var email = $('#email').val();
            // var email_provider = $('#provider_email').val();
            $.ajax({
                url: 'write-postcard',
                type: 'post',
                data: {
                    img: img,
                    // email: email,
                    // email_provider: email_provider
                },
                success :  function(result) {
                    console.log(result);
                    window.location = 'thanks';
                },
                error: function (result) {
                    console.log(result);
                    window.location = 'thanks';
                }
            });
        }
    });
});
