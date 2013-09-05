/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
$(".collapse").collapse();

function configureTable(tableNode) {
    $(tableNode).dataTable({
            sPaginationType:"full_numbers",
            "bJQueryUI":true,
            "sDom":'T<"clear">lfrtip'
        }
    );
}
$(function(){
$('#user_manager_ecode').change(function(){
   id =  $("#user_project_id").val()
    ecode =     $(this).val()
    if(id.length == 0)
   {
      data ={ "ecode": ecode }
   }else
   {
       data ={ "ecode": ecode,"id" : id }
   }

    $.get('/employees/render_projects',data,function(data){
        $('#replace_products').html(data)
    })
});
});
*/