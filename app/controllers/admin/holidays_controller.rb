class Admin::HolidaysController < Admin::ApplicationController
  
  active_scaffold :holiday do |config|
    config.label = 'Holidays'
    
    config.list.columns = [:name, :description, :date, :day, :updater_id]
    
    config.create.columns = config.update.columns = [:name, :description, :date, :day, :remark]
    
    config.show.columns = [:name, :description, :date, :day, :remark, :updater_id, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
