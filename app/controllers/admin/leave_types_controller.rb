class Admin::LeaveTypesController < Admin::ApplicationController
  
  active_scaffold :leave_type do |config|
    config.label = 'Leave Type'
    
    config.list.columns = [:name, :code, :description, :updated_at]
    
    config.create.columns = config.update.columns = [:name, :code, :description]
    
    config.show.columns = [:name, :code, :description, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
