module Admin::BaseHelper
  
  include CommonHelper
  
  def created_at_column(record, column)
    format_date(record.created_at)
  end
  
  def updated_at_column(record, column)
    format_date(record.updated_at)
  end
  
  def link_to_user(user)
    name = (user.full_name.present? ? user.full_name : user.guid)
    link_to name, admin_user_path(user.id)
  end
  
  def link_to_country(country)
    link_to country.name, admin_country_path(country.id)
  end
  
  def link_to_state(state)
    link_to state.name, admin_state_path(state.id)
  end
  
  def link_to_referer(referer)
    link_to referer.title, admin_referer_path(referer.id)
  end
  
  def link_to_status(status)
    link_to status.key, admin_status_path(status.id)
  end
  
  def link_to_device(device)
    link_to device.os_type, admin_device_path(device.id)
  end
  
end