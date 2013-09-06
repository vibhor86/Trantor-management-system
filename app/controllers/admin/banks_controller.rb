class Admin::BanksController < Admin::ApplicationController
  
  active_scaffold :bank do |config|
    config.label = 'Banks'
    
    config.list.columns = [:name, :code, :ifsc_code, :contact_person, :contact_number, :activated, :updater_id]
    
    config.create.columns = 
    config.update.columns = [:name, :code, :address, :ifsc_code, :contact_person, :contact_number, :activated]
    
    config.show.columns = 
    [:name, :code, :address, :ifsc_code, :contact_person, :contact_number, :activated, :updater_id, :created_at, :updated_at]
      
    # Sorting
    config.list.sorting = {:updated_at => 'DESC'}
    
    # Nested Links
    config.nested.add_link(:users, :label => 'Users')
    
    config.create.link.page = config.update.link.page = true
    
  end
  
end
