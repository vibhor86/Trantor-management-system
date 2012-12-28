var updateproject = function(data) {
    $.get('/projects', function(data) {
        $('#change_table').empty();
        $('#change_table').html(data);
        configureprojectTable($('#project_table'));
    }).error(function(jqXHR, textStatus, errorThrown) {
        window.location.href = "/dashboard"
    });
    
}

function configureprojectTable(tableNode)
{
    $(tableNode).dataTable(); 
}
function resetproject()
{
    
        event.preventDefault();
        $('#project_name').val('');
        $('#project_manager_ecode').val(0);
        $('.project_create').attr('disabled',false);
        $('.project_update').attr('disabled',true);
    
}

$(document).ready(function() {
    $('#project_table').dataTable();
    $('.project_update').attr('disabled',true);
    $('body').delegate('.project_update','click', function(event){
        event.preventDefault();
        id = $(this).attr('data');
        $('#project_name').val($('#name_'+id).text());
        $('#project_manager_ecode').val($('#manger_'+id).text())
        $('.project_create').attr('disabled',true);
        $('.project_update').attr('disabled',false);
         $('#project_name').attr('data',id)
    }); 
    $('body').delegate('.project_delete','click', function(event){
        event.preventDefault();
        id = $(this).attr('data');
       data  = {
             '_method': 'delete'
        }
        
        $.ajax({
            url: '/projects/'+id,
            dataType : 'json',
            type:'delete',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateproject(data);
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
   $('.project_reset').on('click', function(event){
       resetproject();
   }); 
    $('.project_create').on('click', function(event){
        event.preventDefault();
        name =  $('#project_name').val();
        ecode =  $('#project_manager_ecode').val();
        data  = {
            'project[name]' : name,
            'project[manager_ecode]' : ecode
        }
        
        $.ajax({
            url: '/projects',
            dataType : 'json',
            type:'post',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateproject(data);
                    resetproject();
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
    
    $('.project_update').on('click', function(event){
        event.preventDefault();
        id = $('#project_name').attr('data')
        name =  $('#project_name').val();
        ecode =  $('#project_manager_ecode').val();
        data  = {
            'project[name]' : name,
            'project[manager_ecode]' : ecode,
            '_method': 'put'
        }
        
        $.ajax({
            url: '/projects/'+id,
            dataType : 'json',
            type:'post',
            data: data,
            success: function(data, textStatus, jqXHR) {
                if(data.valid) {
                    updateproject(data);
                    resetproject();
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





