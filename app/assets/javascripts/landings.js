$.ajaxSetup({
    headers: {
     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});





function clickSend(){
  var email = $('#email').val();
  var name = $('#name').val();
    result = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    if (!name){
        watchError(false, " Name can't be empty");
    } else if (!email) {
        watchError(false, "email can't be empty ");
    } else if (!result) {
        watchError(false, "Invalid email");
    }
    else if (!($('#organization').val())) {
        watchError(false, "Company name can't be empty");
    } else if (!($('#message').val())) {
        watchError(false, "Please tell us what you want to use KAWE for");
    }
    else {
      finalSubmit();
    }
}


function watchError(option, content){
    if(option){
         $('.error').removeClass('alert-danger').addClass('alert alert-success').html(" DEMO request Sent successfully, we will get back to you shortly");
    }else{
         $('.error').addClass('alert alert-danger').html(content);
    }

}

function finalSubmit(){
 $('.error').removeClass("alert-danger").addClass("alert-success").html("Sending Your Request...");
 var info = $('#demo-form');
 $.ajax({
 url: 'landings/request_demo',
 type: 'POST',
 data: info.serialize(),
 success: function(data){
     if (data == "received"){
         watchError(true,"");
     }else if(data=="rejected"){
          watchError(false, "Could not complete your request, please retry");
     }
 },
 error : function(jqXHR, textStatus, errorThrown) {
             watchError(false, "Couldn't complete your request, kindly try again");
           }
 });

}

