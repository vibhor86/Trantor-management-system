class Admin::ApplicationController < ApplicationController
  
  protect_from_forgery
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :json, :rjs, :erb, :js
  
  ActiveScaffold::Config::List.per_page = 15
  
  ActiveScaffold.set_defaults do |config|
    config.delete.link.label = 'Del'
    config.delete.refresh_list = true
    config.dhtml_history = false
  end

end