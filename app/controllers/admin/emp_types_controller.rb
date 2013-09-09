class Admin::EmpTypesController < Admin::ApplicationController
  
  active_scaffold :emp_type do |config|
    config.label = 'Emp Types'
    
    config.list.columns = [:title, :remark, :created_at]
    
    config.create.columns = config.update.columns = [:title, :remark]
    
    config.show.columns = [:title, :remark, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    # Nested Links
    config.nested.add_link(:users, :label => 'Users')
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
