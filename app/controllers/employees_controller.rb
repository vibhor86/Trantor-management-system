class EmployeesController < ApplicationController
  require 'date'
  require 'csv'
  def new
    @user = User.new
  end
  def create
    @user  = User.create(params[:user])
    @user.password = @user.password_confirmation = Devise.friendly_token 
    if @user.save
      render :text => "create"
    else
     redirect_to :action => "new"
    end  
  end 
  def show
    @user = User.find_by_id(params[:id])
  end 
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:user][:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to :action => "new", notice: 'Designation was successfully updated.' }
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
      
      format.json { render :json => {:valid => true,  :notice => "destination was deleted successfully."}}
    end
  end
  
  def unconfirmed_user
    unconfirmation_mail params[:reason][:reason] , current_user
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
          user.password = user.password_confirmation = Devise.friendly_token 
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
  
  
  
end