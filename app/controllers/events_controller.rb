class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    event = []
    events = Event.all
    holidays = Holiday.all
    leaves = Leavemanagement.find(:all,:conditions => {:user_id => current_user.id})
    response = []
    events.collect{|obj| response << { title: obj.name, start: obj.date.to_s }}
    holidays.collect{|obj| response << { title: obj.name, start: obj.date.to_s }}
    leaves.collect{|obj| response << { title: "leave", start: obj.start_date.to_s , end: obj.end_date.to_s }}

    respond_to do |format|
      format.json { render :json => {:data => response }}
    end
  end


end
