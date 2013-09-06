module Admin::BaseHelper
  
  include CommonHelper
  
  def created_at_column(record, column)
    format_date(record.created_at)
  end
  
  def updated_at_column(record, column)
    format_date(record.updated_at)
  end
  
  def link_to_user(user)
    link_to user.name, admin_user_path(user.id)
  end

end