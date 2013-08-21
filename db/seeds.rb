## Employee Types
['Confirmed', 'Probation', 'Trainee', 'Contractual'].each do |emp_type|
  EmpType.where(:title => emp_type).create(:title => emp_type)  
end

## Leave Types
[
  ['Earned Leave', 'EL'], 
  ['Casual Leave', 'CL'], 
  ['Sick Leave', 'SL'], 
  ['Maternity Leave', 'ML'],
  ['Comp Off', 'CO'],  
  ['On office Duty/Present but card not shown/On Client site', 'O']
].each do |leave_type|
  LeaveType.where(:name => leave_type).create(:name => leave_type.first, :code => leave_type.last)
end

## Bands
['L1', 'L2', 'L3', 'L4', 'L5'].each do |band|
  Band.where(:name => band).create(:name => band)
end

## Banks
['Axis', 'ICICI', 'HDFC', 'Kotak', 'SBI', 'SBP', 'CitiBank'].each do |bank|
  Bank.where(:name => bank).create(:name => bank, :code => bank.capitalize)
end

## Sample User
User.where(:email => 'moinhaidar@gmail.com').first_or_create(
  :emp_type_id => EmpType.find_by_title('Confirmed').id,
  :password => 'password', 
  :password_confirmation => 'password',
  :ecode => 'admin',
  :name => 'Super Admin',
  :date_of_joining => Date.today.to_s(:db),
  :date_of_birth => 20.years.ago.to_s(:db),
  :role => 'admin'
)

## Designations
['Analyst', 'Assistant Manager - HR', 'Associate Software Engineer', 'Business Operation Manager', 'Contractor', 'Data Analyst', 'Delivery Manager', 'Digital Marketing Team Lead', 'Director - India Delivery Center', "Director - Managed Business Service Unit", 'HR Executive', 'Inside Sales Executive', 'Internet Marketing Team lead', 'Manager - Finance', 'Manager - HR', 'Project Coordinator', 'Project Lead', 'Project Manager', 'Senior Business Analyst', 'Senior DBA', 'Senior Engagement Manager - AML', 'Senior Inside Sales Executive', 'Senior IT Manager', 'Senior Resercher', 'Senior Software Engineer', 'Senior Sys Admin', 'Senior Tech Architect', 'Senior Technical Recruiter', 'Senior Technical Writer',
'Software Engineer', 'Team Lead', 'Tech Lead', 'Technical Manager', 'Technical Writer']. each do |designation|
  Designation.where(:name => designation).create(:name => designation)
end

## Projects
['AdaraMedia', 'Admin', 'BOTW', 'CAN', 'Conductiv', 'Contractor', 'Dealtraction', 'Finance', 'HR & Rect', 'Inhouse', 'IT', 'Jugnu', 'LinkSV', 'Management', 'MSBU', 'Nimbus', 'QBF', 'RefCheck', 'Third Pillar', 'Trainee' ].each do |project|
  Project.where(:title => project).create(:title => project)
end
