class LeavemanagementsController < ApplicationController
  # GET /leavemanagements
  # GET /leavemanagements.json
  require 'ruby-debug'
  def index
    @leavemanagements = Leavemanagement.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leavemanagements }
    end
  end
  # GET /leavemanagements/1
  # GET /leavemanagements/1.json
  def show
    @leavemanagement = Leavemanagement.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @leavemanagement }
    end
  end
  # GET /leavemanagements/new
  # GET /leavemanagements/new.json
  def new
    @leavemanagement = Leavemanagement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @leavemanagement }
    end
  end

  # GET /leavemanagements/1/edit
  def edit
    @leavemanagement = Leavemanagement.find(params[:id])
  end

  # POST /leavemanagements
  # POST /leavemanagements.json
  def create
   totaldata = []
   working_day =  ((params[:leavemanagement][:start_date].to_date)..(params[:leavemanagement][:end_date].to_date)).select {|d| (1..5).include?(d.wday) }
   holidays = Holiday.all(:conditions => ["DATE(date) BETWEEN ? AND ?", params[:leavemanagement][:start_date],params[:leavemanagement][:start_date]]) 
   totaldata =  working_day - holidays.collect!{|holiday| holiday.date.to_date}
   leave_type = params[:leavemanagement][:leave_type]
   leave_balance_instance = Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,leave_type)
   leavecalculation leave_balance_instance , totaldata
    
    
   totaldata.each do |td|
     @leavemanagement = Leavemanagement.new(:start_date => td,:end_date => td,:user_id => current_user.id,:leave_type_id => leave_type )
     @leavemanagement.save!
   end   
   respond_to do |format|
       format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully created.' }
       format.json {render :json => {:data => params }}
   end
  end

  # PUT /leavemanagements/1
  # PUT /leavemanagements/1.json
  def update
    @leavemanagement = Leavemanagement.find(params[:id])
    respond_to do |format|
      if @leavemanagement.update_attributes(params[:leavemanagement])
        format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @leavemanagement.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /leavemanagements/1
  # DELETE /leavemanagements/1.json
  def destroy
    @leavemanagement = Leavemanagement.find(params[:id])
    @leavemanagement.destroy
    respond_to do |format|
      format.html { redirect_to leavemanagements_url }
      format.json { head :no_content }
    end
  end

  def add
    event = Event.new(params[:data])
    respond_to do |format|
      format.json {render :json => {:data => params }}
    end
  end
  
def total_balance 
  balance_instance = Leavebalance.first(conditions: {:user_id => current_user.id, :leave_type_id => params[:leave_type_id] } )
  @balance = balance_instance ? balance_instance.balance.to_i : 0  
  render :partial => "total_balance"
end  
 
def leavecalculation leave_balance_instance , totaldata
  if leave_balance_instance && leave_balance_instance.balance < totaldata.count
      
  end
end  

def leave_deduction_sequence
  {"1" => "CO" ,
   "2" => "EL",
   "3" => "CL",
   "4" => "FSL",
   "5" => "POD"
   }
end  



end
