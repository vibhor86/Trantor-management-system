  var temp_value =  $('#template option:selected').val();

  $('#template').change(function() {
    temp_value= $('#template option:selected').val();
    $('#sampleLink').replaceWith("<a id='sampleLink', href= 'show.pdf?temp_value="+temp_value+"'>"+ 'Pdf of ' + $('#template option:selected').text()+"</a>");
  });

  $('#submit').click(function()
  {
    if($('#subject').val() == 0)
      confirm("Are you sure you want to send email(s) without subject?");
    if(CKEDITOR.instances.email_body.getData().length == 0)
      confirm("Are you sure you want to send email(s) without body?");

  });

  function Checkfiles()
  {
    var fup = document.getElementById('form_file');
    var email=document.getElementById('sender_email');
    var fileName = fup.value;
    var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
    if(ext == "csv" && $('#sender_email').val() != 0 )
    {
      return true;
    }
    if(ext != "csv" )
    {
      alert("Please upload CSV files");
      fup.focus();
      return false;
    }
    if($('#sender_email').val() == 0 )
    {
      alert("Email can't be blank");
      email.focus();
      return false;
    }
      

  }

