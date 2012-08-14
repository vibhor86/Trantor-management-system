class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, :alert => exception.message
  end
  
  def local_request?
    false
  end

  def rescue_action_in_public(exception)
    case exception
    when ActiveRecord::RecordNotFound
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    else
      super
    end
  end
end
