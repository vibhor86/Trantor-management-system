var updateband = function(data) {
    $.get('/bands', function(data) {
        $('#change_table').empty();
        $('#change_table').html(data);
        configurebandTable($('#band_table'));
    }).error(function(jqXHR, textStatus, errorThrown) {
        window.location.href = "/dashboard"
    });
    
}

function configurebandTable(tableNode)
{
    $(tableNode).dataTable(); 
}
function resetband()
{
    
        event.preventDefault();
        $('#band_name').val('');
        $('.band_create').attr('disabled',false);
        $('.band_update').attr('disabled',true);
    
}

$(document).ready(function() {
    $('#band_table').dataTable();
    $('.band_update').attr('disabled',true);
    $('body').delegate('.band_update','click', function(event){
        event.preventDefault();
        id = $(this).attr('data');
        $('#band_name').val($('#name_'+id).text());
        $('.band_create').attr('disabled',true);
        $('.band_update').attr('disabled',false);
         $('#band_name').attr('data',id)
    }); 
    $('body').delegate('.band_delete','click', function(event){
        event.preventDefault();
        id = $(this).attr('data');
       data  = {
             '_method': 'delete'
        }
        
        $.ajax({
            url: '/bands/'+id,
            dataType : 'json',
            type:'delete',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateband(data);
                    resetdis();
                } else {
                    var errorText = getErrorText(data.errors);
                    
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status === 403) {
                    window.location.href = "/dashboard";
                }else{
                   
                }	
            }
	
        });
        
    }); 
   $('.band_reset').on('click', function(event){
       resetband();
   }); 
    $('.band_create').on('click', function(event){
        event.preventDefault();
        name =  $('#band_name').val();
        data  = {
            'band[name]' : name 
        }
        
        $.ajax({
            url: '/bands',
            dataType : 'json',
            type:'post',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateband(data);
                    resetband();
                } else {
                    var errorText = getErrorText(data.errors);
                    
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status === 403) {
                    window.location.href = "/dashboard";
                }else{
                   
                }	
            }
	
        });
    });  
    
    $('.band_update').on('click', function(event){
        event.preventDefault();
        id = $('#band_name').attr('data')
        name =  $('#band_name').val();
        data  = {
            'band[name]' : name,
            '_method': 'put'
        }
        
        $.ajax({
            url: '/bands/'+id,
            dataType : 'json',
            type:'post',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateband(data);
                    resetband();
                } else {
                    var errorText = getErrorText(data.errors);
                    
                }
            },
            error : function(jqXHR, textStatus, errorThrown) {
                if (jqXHR.status === 403) {
                    window.location.href = "/dashboard";
                }else{
                   
                }	
            }
	
        });
    });
    
    
    
    
 
} );





