class Admin::UsersController < Admin::ApplicationController
  
   active_scaffold :user do |config|
    config.label = 'Users'
    
    
  end
  
end
