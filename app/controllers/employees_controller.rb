class EmployeesController < ApplicationController
  require 'date'
  require 'csv'
  before_filter :check_confirmation
  before_filter :blacklist , :only => [:create,:update]
  load_and_authorize_resource :class => "User"

  def new
    @user = User.new
    @projects = []
  end

  def create
    @user = User.new(@data)
    if @user.save
      @user.create_from_csv = true
      flash[:notice] = "User Save"
      redirect_to :action => "new"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to :action => "new"
    end

  end 

  def show
    @user = User.find_by_id(params[:id])
  end 

  def edit
    @projects = []
    @user = User.find(params[:id])
   
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(@data)
        format.html { redirect_to request.referer, notice: 'Employee was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  # DELETE /designations/1
  # DELETE /designations/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.json { render :json => {:valid => true,  :notice => "Employee was deleted successfully."}}
    end
  end
  def unconfirmed_user
    AdminMailer.unconfirmation_mail(params[:reason] , current_user).deliver
    reset_session
    render :text => "Message Send Successfuly Hr Will Responce this message very soon "
  end
  def csv_import
    data = nil
    index = 0
    user_attributes = []  
    header_row = first_row = nil
    User.column_names.each do |key,val|
      user_attributes << key   
    end

     CSV.foreach(params[:dump][:file].tempfile.to_path.to_s) do |row|
      user = User.new     
      temp = [] 
      first_row = row  if index == 0
      header_row = row if index == 1
      next if (index += 1) < 3 
      28.times do |col|
        if first_row[col]
          user = reference_model(first_row[col],row[col],user,temp,header_row[col])
        else
#          user.password = user.password_confirmation = Devise.friendly_token 
          if header_row[col] && !header_row[col].scan("date").empty? && !row[col].nil?
            user.send(header_row[col]+'=',Date.parse(row[col])) if user_attributes.include?(header_row[col])
          else
            user.send(header_row[col]+'=',row[col]) if user_attributes.include?(header_row[col])
          end
        end 
      end
      puts user.attributes
      if user.save!
        data = ""
        temp.each do |id|
           balance = Leavebalance.find_by_id(id)  if id
           balance.user_id = user.id
           balance.save!
        end
        data =  "Upload Successfully"
      else
        
        data = user.errors.full_messages.join(',')
      end
    end
    flash[:notice] = data
    redirect_to :action => "new" 
  end
  
  def reference_model instance , value , user,temp,header_row
    if ["Band","Designation"].include?(instance)
      object = instance.constantize.find_by_name value
      user.send(instance.downcase+'_id=',object.id) if object
    elsif instance == "User"
      project = Project.find_by_manager_ecode value
      user.send('project_id=',project.id) if project
      user.send('manager_ecode=',value)
    elsif instance == "LeaveType"
      object = instance.constantize.find_by_name header_row
      leave = Leavebalance.create!(:leave_type_id => object.id , :balance => value) if object
      temp << leave.id 
     elsif instance == "Emptype"
      object = instance.constantize.find_by_name value
      user.send(instance.downcase+'_id=',object.id) if object  
    end
    return user
  end

  def all_employees
    @employee = User.all
  end
  def render_projects
    @user = User.find(params[:id]) if params[:id]
    @projects = Project.find_all_by_manager_ecode(params[:ecode])
    render "_project"  ,:layout => false
  end
  def history
  @users_history = User.all
  @employee_info = []
     unless params[:emp_history].nil?
       user = User.find_by_ecode(params[:emp_history][:ecode])
        @employee_info = user.audits
      end
  end
private
  def blacklist
    access_role = ["admin","hr"]
    @data = params[:user]
    decline = ["manager_ecode","email","designation_id","project_id", "remember_me" ,"ecode","name", "date_of_joining", "band_id", "gender", "location", "id"]
    @data.delete_if {|key, value| decline.include? key }   unless access_role.include? current_user.role

  end
  
end
