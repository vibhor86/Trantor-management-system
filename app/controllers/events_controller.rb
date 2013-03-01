class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    event = []
    events = Event.all
    holidays = Holiday.all
    leaves = Leavemanagement.find(:all,:conditions => {:user_id => current_user.id})
    response = events.collect { |obj| response << { :title => obj.name, :start => obj.date.to_s } }
    holidays.collect{|obj| response << { :title => obj.name, :start => obj.date.to_s }}
    leaves.each do |lv|
       title = lv.leave_type 
       response << { :title=> title.name, :start=> lv.start_date.to_s , :end => lv.end_date.to_s }
    end     
  respond_to do |format|
    format.json { render :json => {:data => response }}
  end
end

  def remove_event
    

  end  
  
  
  
  
  
end
