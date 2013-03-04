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
    event = Leavemanagement.first(:conditions => ["DATE(start_date)= ? AND user_id = ? AND approved = ?", params[:start_date].to_date,current_user.id, false] ) 
    
    respond_to do |format|
      if event 
        event.destroy
        format.json {render :json => {:valid => true}}
      end
        format.json {render :json => {:data => false}}
    end
  end  
  
  
  
  
  
end
