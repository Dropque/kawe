$.ajaxSetup({
    headers: {
     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
});

function email_subscribe(){
  var subz = $('#email-subscribe');
  var emai = $("#emai").val();
   resul = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(emai);
      if (!emai){
          watchErro(false, "Email can't be empty");
      }
      else if(!resul){
          watchErro(false, "The email you entered is invalid");
      }
      else {
           $('.erro').removeClass("alert-danger").addClass("alert-success").html("Adding you to our subcription list please wait...");
          $.ajax({
              url: 'landings/subscribe',
              type: 'POST',
              data: subz.serialize(),
              success: function(data){
                  if (data == "true"){
                     watchErro(true,"Thanks for Subscribing, We shall get back to you shortly!");
                  }else if(data == "false"){
                       watchErro(false, "Could not complete, please try again");
                  }
              },
              error : function(jqXHR, textStatus, errorThrown) {
                               watchErro(false, "Couldn't complete your request, kindly try again");
              }
          });
        }
}



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
         $('.error').removeClass('alert-danger').addClass('alert alert-success').html(content);
    }else{
         $('.error').addClass('alert alert-danger').html(content);
    }

}

function watchErro(option, content){
    if(option){
         $('.erro').removeClass('alert-danger').addClass('alert alert-success').html(content);
    }else{
         $('.erro').addClass('alert alert-danger').html(content);
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
         watchError(true,"DEMO request Sent successfully, we will get back to you shortly");
     }else if(data=="rejected"){
          watchError(false, "Could not complete your request, please retry");
     }
 },
 error : function(jqXHR, textStatus, errorThrown) {
             watchError(false, "Couldn't complete your request, kindly try again");
           }
 });

}

