class DashboardController < ApplicationController
  
  require "net/http"
  
  before_filter :check_confirmation
  
  skip_authorize_resource :only => :index
  
  def index
    @not_accepted_leaves = []
    
#    full_data
    @user = current_user
#    users.each do |user|
#      LeaveApplication.find(:all,:conditions => {:user_id => user.id ,:approved => false }).each do |leave|
#        @not_accepted_leaves <<  leave
#      end
#    end
    
  end
end
