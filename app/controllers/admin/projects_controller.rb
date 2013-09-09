class Admin::ProjectsController < Admin::ApplicationController
  
  active_scaffold :project do |config|
    config.label = 'Projects'
    
    config.list.columns = [:title, :description, :start_date, :end_date, :contact_person, :updater_id]
    
    config.create.columns = config.update.columns = [:title, :description, :start_date, :end_date, :contact_person]
    
    config.show.columns = [:title, :description, :start_date, :end_date, :contact_person, :updater_id, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
