class DashboardController < ApplicationController

  before_filter :check_confimation
  skip_authorize_resource :only => :dashboard
  def dashboard
 
    @dates = []
    @fist_day_of_week = Date.today.beginning_of_week
    absent_date =  Absent.all(:conditions => ["ecode =  ? AND DATE(date) BETWEEN ? AND ?", current_user.ecode,  @fist_day_of_week, Date.today])
  unless absent_date.empty?
    absent_date.each do |abs|
      @dates << abs.date.to_date
    end
  end
  end
end
