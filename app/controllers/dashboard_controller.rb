class DashboardController < ApplicationController
  
  require "ruby-debug"
  require "net/http"
  
  before_filter :check_confimation
  
  skip_authorize_resource :only => :dashboard
  
  def dashboard
    @not_accepted_leaves = []
    
    full_data()
    
    users = User.find_all_by_manager_ecode(current_user.ecode)
    
    users.each do |user|
      Leavemanagement.find(:all,:conditions => {:user_id => user.id ,:approved => false   }).each do |leave|
       @not_accepted_leaves <<  leave
      end
    end
    
  end
end
