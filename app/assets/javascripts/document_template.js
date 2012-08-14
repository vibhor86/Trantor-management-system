$(".placeholder").pageslide({
    direction: "left", 
    modal: true
});
$(document).ready(function(){
    CKEDITOR.replace( 'document_template_body', {
        extraPlugins : 'autogrow',
        removePlugins : 'resize'
    });
});
