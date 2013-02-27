class DashboardController < ApplicationController
require "ruby-debug"
require "net/http"
  before_filter :check_confimation
  skip_authorize_resource :only => :dashboard
  def dashboard
    ecode = current_user.ecode.gsub(/e/,"0000")
    @jsons_dates = date_range = @dates = []
    @fist_day_of_week = Date.today.beginning_of_week
    @fist_day_of_month = Date.today.beginning_of_month
    response = Net::HTTP.post_form(URI.parse('http://192.168.0.50:4567/attendance.json'), {"ecode" => "#{ecode}", "start_date" => "#{@fist_day_of_month - 2.month}", "end_date" => "#{Date.today}"})
    JSON.parse(response.body).collect { |a| @jsons_dates <<  a["validDate"].to_date } if response.body
    holidays = Holiday.all(:conditions => ["DATE(date) BETWEEN ? AND ?", @fist_day_of_month - 2.month, Date.today]) 
    working_days = ((@fist_day_of_month - 2.month)..(Date.today-1.day) ).select {|d| (1..5).include?(d.wday) }
    missing = working_days - @jsons_dates  - holidays.collect!{|holiday| holiday.date.to_date}
    leave_apply = Leavemanagement.all(:conditions => ["user_id =  ? AND DATE(start_date) BETWEEN ? AND ?", current_user.id,  @fist_day_of_month - 2.month, Date.today]) 
    @not_apply_date =  missing - leave_apply.collect{|ap| ap.start_date.to_date} 
   end
end
