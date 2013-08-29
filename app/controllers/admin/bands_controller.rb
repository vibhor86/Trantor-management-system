class Admin::BandsController < Admin::ApplicationController
  
  active_scaffold :band do |config|
    config.label = 'Bands'
    
    config.list.columns = [:name, :description]
    
    config.create.columns = config.update.columns = [:name, :description]
    
    config.show.columns = [:name, :description, :updator, :created_at, :updated_at]
      
    # Sorting
    list.sorting = {:updated_at => 'DESC'}
    
    # Nested Links
    config.nested.add_link(:users, :label => 'Users')
    
  end
  
end