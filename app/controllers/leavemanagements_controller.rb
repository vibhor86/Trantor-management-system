class LeavemanagementsController < ApplicationController
  # GET /leavemanagements
  # GET /leavemanagements.json

 
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

  def calender
    #    expire_action :action => :calender
    full_data()
  end

  # GET /leavemanagements/1/edit
  def edit
    @leavemanagement = Leavemanagement.find(params[:id])
  end

  # POST /leavemanagements
  # POST /leavemanagements.json
  def create
    apply_leave_type_id = params[:leavemanagement][:leave_type]
    leave_balance_instance = Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,apply_leave_type_id)
    apply_leave_type_instance =  LeaveType.find_by_id(apply_leave_type_id)
    
    @apply_leave_balance =  leave_balance_instance ? leave_balance_instance.balance : 0

    if @apply_leave_balance > 0 || included_types.include?(apply_leave_type_instance.name)
     
      @totaldates = []
      
      working_day =  ((params[:leavemanagement][:start_date].to_date)..(params[:leavemanagement][:end_date].to_date)).select {|d| (1..5).include?(d.wday) }
      
      holidays = Holiday.all(:conditions => ["DATE(date) BETWEEN ? AND ?", params[:leavemanagement][:start_date],params[:leavemanagement][:start_date]]) 
      @totaldates =  working_day - holidays.collect!{|holiday| holiday.date.to_date}
      
     
      
      if @totaldates.count <= @apply_leave_balance || included_types.include?(apply_leave_type_instance.name)
        if included_types.include?(apply_leave_type_instance.name)
          @totaldates.each do |td|
            leave_management = Leavemanagement.new(:start_date => td,:end_date => td,:user_id => current_user.id,:leave_type_id => apply_leave_type_id  )
            leave_management.save!
          end
        else
          @totaldates.each do |td|
            leave_management = Leavemanagement.new(:start_date => td,:end_date => td,:user_id => current_user.id,:leave_type_id => apply_leave_type_id  )
            leave_management.save!
            @apply_leave_balance = @apply_leave_balance - 1
          end
          leave_balance_instance.update_attributes(:balance => @apply_leave_balance)
        end
      end
      
      
      
      
      
      #      if @totaldates.count > @apply_leave_balance && ["CL","FSL","HSL"].include?(apply_leave_type_instance.name)
      #        leave_deduction_sequence(apply_leave_type_instance).each do |ld|
      #          if @totaldates.count > 0	
      #            other_leave_type_instance =  LeaveType.find_by_name(ld)
      #            if other_leave_type_instance && current_user
      #              other_balance_instance =  Leavebalance.find_by_user_id_and_leave_type_id(current_user.id,other_leave_type_instance.id)  
      #              other_balance_instance_balance =  other_balance_instance ? other_balance_instance.balance : 0
      #              @totaldates.each do |td|
      #                data = []
      #                if other_balance_instance_balance > 0
      #                  leave_management = Leavemanagement.new(:start_date => td,:end_date => td,:user_id => current_user.id,:leave_type_id => other_leave_type_instance.id )
      #                  leave_management.save!
      #                  data << td
      #                  @totaldates = @totaldates - data
      #                  other_balance_instance_balance = other_balance_instance_balance - 1
      #                  other_balance_instance.update_attributes(:balance => other_balance_instance_balance)
      #                else
      #                  break  
      #                end 
      #              end
      #            else
      #              next
      #            end 
      #          end  
      #        end
      #      else  
      #        @totaldates.each do |td|
      #          if @apply_leave_balance > 0
      #            leave_management = Leavemanagement.new(:start_date => td,:end_date => td,:user_id => current_user.id,:leave_type_id => apply_leave_type_id )
      #            leave_management.save!
      #            @apply_leave_balance = @apply_leave_balance - 1
      #          end 
      #        end
      #        leave_balance_instance.update_attributes(:balance => @apply_leave_balance)
      #      end
        
      respond_to do |format|
        format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully created.' }
        format.json {render :json => {:data => params ,:valid => true }}
      end
    else
      respond_to do |format|
        format.html { redirect_to @leavemanagement, notice: 'Leavemanagement was successfully created.' }
        format.json {render :json => {:valid => false }}
      end
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
 
  def leavecalculation balance , totaldata
    balance < totaldata.count
  end  

  def leave_deduction_sequence leave
    if leave.name == "CL"
      return    ["CO" ,"EL","CL","FSL"] - current_user.leavebalances.where('balance = 0').collect{|ss| ss.leave_type.name  unless ss.leave_type.nil?}
    elsif leave.name == "FSL"
      return  ["CO" ,"EL","FSL","CL"] - current_user.leavebalances.where('balance = 0').collect{|ss| ss.leave_type.name  unless ss.leave_type.nil?}
    else
      []
    end 
  end  

 

end
