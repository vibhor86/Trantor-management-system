class Admin::UsersController < Admin::ApplicationController
  
   active_scaffold :user do |config|
    config.label = 'Users'
    
    config.list.columns = [:ecode, :name, :mobile, :manager_id, :band_id, :designation_id, :sign_in_count]
    
    config.create.columns = config.update.columns = [
      :manager_id, :band_id, :bank_id, :designation_id, :emp_type_id, :preference_id, 
      :ecode, :name, :email, :mobile, :gender, :father_name, 
      :spouse_name, :date_of_birth, :marital_status, :date_of_anniversary, :address, :date_of_joining, 
      :blood_group, :pan_no, :pf_no, :esi_no, :role, :salary 
    ]
    
    config.show.columns = [
      :manager_id, :band_id, :bank_id, :designation_id, :emp_type_id, :preference_id, 
      :ecode, :name, :email, :mobile, :gender, :father_name, 
      :spouse_name, :date_of_birth, :marital_status, :date_of_anniversary, :address, :date_of_joining, 
      :blood_group, :pan_no, :pf_no, :esi_no, :role, :salary, :creator, :updator, 
      :soft_delete, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, 
      :confirmed_at, :confirmation_sent_at, :created_at, :updated_at
    ]
      
    # Sorting
    list.sorting = {:updated_at => 'DESC'}
    
    # Labels
    columns[:emp_type].label = 'Emp Type'
    columns[:date_of_birth].label = 'Birthday'
    columns[:marital_status].label = 'Married'
    columns[:date_of_anniversary].label = 'Anniversary Day'
    columns[:date_of_joining].label = 'Anniversary Day'
    columns[:pan_no].label = 'PAN NO'
    columns[:pf_no].label = 'PF NO'
    columns[:esi_no].label = 'ESI NO'
    columns[:sign_in_count].label = "SignIn #"
    columns[:current_sign_in_at].label = 'Current SignIn'
    columns[:last_sign_in_at].label = 'Last SignIn'
    columns[:current_sign_in_ip].label = 'Current SignIn IP'
    columns[:last_sign_in_ip].label = 'Last SignIn IP'
    columns[:created_at].label = 'Created'
    columns[:updated_at].label = 'Updated'
    
    # Nested Links
    config.nested.add_link(:projects, :label => 'Projects')
    config.nested.add_link(:absents, :label => 'Absents')
    config.nested.add_link(:leave_applications, :label => 'Leaves')
    
  end
  
end
