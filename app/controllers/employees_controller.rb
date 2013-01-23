class EmployeesController < ApplicationController
  require 'date'
  require 'csv'
  before_filter :check_confimation
  before_filter :blacklist ,:only => [:create,:update]
  def new
    @user = User.new
    @managers = User.find(:all,:conditions => {:role => "manager"})

  end
  def create
    #    @user  = User.create(params[:user])
    if @user.save
      flash[:notice] = "User Save"
      redirect_to :action => "new"
    else
      flash[:error] = "Can't be able to create "
      puts flash[:error]
      redirect_to :action => "new"
    end  
  end 
  def show
    @user = User.find_by_id(params[:id])
  end 
  def edit
    @user = User.find(params[:id])
    @managers = User.find(:all,:conditions => {:role => "manager"})
  end
  def update
    respond_to do |format|
      if @user.save
        format.html { redirect_to "/employees/all_employees", notice: 'Employee was successfully updated.' }
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
    user_attributes = []
    user = User.new
    index = 0
    header_row = first_row = nil
    user.attributes.each do |key,val|
      user_attributes << key   
    end
    CSV.foreach(params[:dump][:file].tempfile.to_path.to_s) do |row|
      first_row = row  if index == 0
      header_row = row if index == 1
      next if (index += 1) < 3 
      user_attributes.count.times do |col|
        if first_row[col]
          user = reference_model(first_row[col],row[col],user)
        else
#          user.password = user.password_confirmation = Devise.friendly_token 
          if header_row[col] && !header_row[col].scan("date").empty?
            user.send(header_row[col]+'=',Date.parse(row[col])) if user_attributes.include?(header_row[col])
          else
            user.send(header_row[col]+'=',row[col]) if user_attributes.include?(header_row[col])
          end
        end 
      end
      puts user.attributes
      if user.save
        data =  "create"
      else
        data = user.errors
      end
    end
    render  :text => data
  end
  
  def reference_model instance , value , user
    if ["Band","Designation"].include?(instance)
      object = instance.constantize.find_by_name value
      user.send(instance.downcase+'_id=',object.id) if object
    elsif instance == "User"
      project = Project.find_by_manager_ecode value
      user.send('project_id=',project.id) if project
      user.send('manager_ecode=',value)
    end
    return user
  end

  def all_employees
    @employee = User.all
  end
  
  def history
   @employee_info = []
     unless params[:emp_history].nil?
       user = User.find_by_ecode(params[:emp_history][:ecode])
        @employee_info = user.audits if user
      end
  end
private
  def blacklist
    @data = {}
      blacklist = [ :email,:designation_id,:project_id, :remember_me ,:ecode,:name, :date_of_joining, :band_id, :gender, :location, :id, :manager_ecode]
    @data = params[:user]
    @data.reject! { |h| blacklist.include? h }
    if params[:action] == "create"
      @user = User.create(@data)
    elsif params[:action] == "update"
      @user = User.find(params[:user][:id])
      @user.update_attributes(@data)
      @user = @user
    end

      @user.email = params[:user][:email]
      @user.designation_id = params[:user][:designation_id]
      @user.ecode = params[:user][:ecode]
      @user.name = params[:user][:name]
      @user.date_of_joining = params[:user][:date_of_joining]
      @user.band_id = params[:user][:band_id]
      @user.gender = params[:user][:gender]
      @user.location = params[:user][:location]
      @user.manager_ecode = params[:user][:manager_ecode]
    project = Project.find_by_manager_ecode params[:user][:manager_ecode]
      @user.project_id = project.id if project
  end
  
end
