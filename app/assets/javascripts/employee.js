$(function() {
    $('#info').on('click', function(event){
      reason =   $('#reason_res').val()
      
      $.get('/employees/unconfirmed_user',{'reason' : reason },function(data){
         window.location.href = "/users/sign_in"
         alert(data) 
      })
        
    }); 
    
});