LeaveType.create(:name => "Earned Leave")
LeaveType.create(:name => "Casual Leave")
LeaveType.create(:name => "Sick Leave")
LeaveType.create(:name => "Maternity Leave" )
LeaveType.create(:name => "Onsite/On Office Duty/Work From Home/Present but Card not shown")

Emptype.create(:name => "Probation")
Emptype.create(:name => "Confirmed")
Emptype.create(:name => "Trainee")

User.where(:email => 'moinhaidar@gmail.com').first_or_create(
:password => 'password', 
:password_confirmation => 'password',
:ecode => 'admin',
:name => 'Super Admin',
:date_of_joining => Date.today.to_s(:db),
:date_of_birth => (Date.today - 20.years.ago).to_s(:db),
:role => 'admin',
:emptype_id => 2
)