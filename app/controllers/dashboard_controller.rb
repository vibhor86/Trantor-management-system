class DashboardController < ApplicationController

  before_filter :check_confimation
  skip_authorize_resource :only => :dashboard
  def dashboard 
  end
  
end
