class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
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
def full_data
 
  ecode = current_user.ecode.gsub(/e/,"0000")
    @jsons_dates = date_range = @dates = []
    @fist_day_of_week = Date.today.beginning_of_week
    fist_day_of_month = Date.today.beginning_of_month
    fist_day_of_fatch_month = fist_day_of_month - 2.month
    confirmed_at = current_user.confirmed_at
#    fist_day_of_fatch_month  = confirmed_at.to_date > fist_day_of_fatch_month ? confirmed_at : fist_day_of_fatch_month.to_date
  fist_day_of_fatch_month  = fist_day_of_fatch_month.to_date
   begin
    response = Net::HTTP.post_form(URI.parse('http://192.168.0.50:4567/attendance.json'), {"ecode" => "#{ecode}", "start_date" => "#{fist_day_of_fatch_month.to_date}", "end_date" => "#{Date.today}"})
   rescue
   end
    JSON.parse(response.body).collect { |a| @jsons_dates <<  a["validDate"].to_date } if response && response.body
    holidays = Holiday.all(:conditions => ["DATE(date) BETWEEN ? AND ?", fist_day_of_fatch_month.to_date, Date.today])
    working_days = ((fist_day_of_fatch_month.to_date)..(Date.today-1.day) ).select {|d| (1..5).include?(d.wday) }
    missing = working_days - @jsons_dates  - holidays.collect!{|holiday| holiday.date.to_date}
    leave_apply = Leavemanagement.all(:conditions => ["user_id =  ? AND DATE(start_date) BETWEEN ? AND ?", current_user.id,  fist_day_of_fatch_month.to_date, Date.today])
    @not_apply_date =  missing - leave_apply.collect{|ap| ap.start_date.to_date} 
end


  def check_confimation
    if current_user &&  current_user.confirmation_status == "pending"
      flash[:notice]  =  "Please First Confirm your Account"
      redirect_to "/users/edit"
    end
  end
  
  def included_types
  ["Maternity Leave","Onsite/On Office Duty/Work From Home/Present but Card not shown"]
end  
  
end
