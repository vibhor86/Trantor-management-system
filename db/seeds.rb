# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
LeaveType.create(:name => "Earned Leave")
LeaveType.create(:name => "Casual Leave")
LeaveType.create(:name => "Sick Leave")
LeaveType.create(:name => "Maternity Leave" )
LeaveType.create(:name => "Onsite/On Office Duty/Work From Home/Present but Card not shown")

Emptype.create(:name => "Probation")
Emptype.create(:name => "Confirmed")
Emptype.create(:name => "Trainee")

user =  User.new(:email => 'nidhi.ayri@trantorinc.com', :password => 'password', :password_confirmation => 'password')
 user.ecode = 'e00015'
 user.name = "Nidhi"
 user.date_of_joining = "15-04-2012"
 user.date_of_birth = "22-11-1980"
user.role = "admin"
user.emptype_id = 2
 user.save!
