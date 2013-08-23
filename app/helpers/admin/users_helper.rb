module Admin::UsersHelper
  
  def user_name_column(record, column)
    truncate(record.name, :length => 25) 
  end
  
  def user_referer_id_form_column(record, options)
    select :record, :referer_id, options_for_referer_id_select
  end
  
end