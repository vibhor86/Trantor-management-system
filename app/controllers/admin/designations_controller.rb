class Admin::DesignationsController < Admin::ApplicationController
  
  active_scaffold :designation do |config|
    config.label = 'Designations'
    
    config.list.columns = [:name, :description, :activated, :updater_id]
    
    config.create.columns = 
    config.update.columns = [:name, :description, :activated]
    
    config.show.columns = 
    [:name, :description, :activated, :updater_id, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    # Nested Links
    config.nested.add_link(:users, :label => 'Users')
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
