module CommonHelper
  
  def format_date(date)
    date ? date.strftime("%d/%m/%Y") : ''
  end
  
  def format_time(time)
    time ? time.strftime("%d/%m/%Y, %H:%M:%S") : ''
  end
  
  def datetime_ago(datetime)
    "#{time_ago_in_words(datetime)} ago"
  end
  
  def options_for_manager_select
    User.where(:role => MANAGER).collect{|u| [u.name, u.id]}.unshift(['Select Manager', ''])
  end
  
  def options_for_band_select
    Band.all.collect{|band| [band.name, band.id]}.unshift(['Select Band', ''])
  end
  
  def options_for_bank_select
    Bank.all.collect{|bank| [bank.name, bank.id]}.unshift(['Select Bank', ''])
  end
  
  def options_for_designation_select
    Designation.all.collect{|d| [d.name, d.id]}.unshift(['Select Designation', ''])
  end
  
  def options_for_emp_type_select
    EmpType.all.collect{|et| [et.title, et.id.to_i]}.unshift(['Select Employee Type', ''])
  end
  
  def options_for_gender_select
    [['I am Confused', ''], ['I am Male', 'Male'], ['I am Female', 'Female']]
  end
  
  def options_for_marital_status_select
    ['Not Sure', 'Married', 'Unmarried', 'Divorced', 'Widowed', 'Engaged'].collect{ |ms| [ms, ms] }
  end
  
  def options_for_blood_group_select
    ['A+', 'A-', 'B-', 'B+', 'AB-', 'AB+', 'O+', 'O-',].collect{ |bg| [bg, bg] }
  end
  
  def options_for_role_select
    [['None',''], ['Admin', 'admin'], ['Manager', 'manager'], ['Employee', 'employee'], ['User', 'user']]
  end
  
end