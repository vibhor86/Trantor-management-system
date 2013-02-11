# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
LeaveType.create(:name => "EL")
LeaveType.create(:name => "CL")
LeaveType.create(:name => "SL")
#LeaveType.create(:name => "probated")
#LeaveType.create(:name => "confirmed")
#LeaveType.create(:name => "Trainee")
#LeaveType.create(:name => "probated")
#LeaveType.create(:name => "confirmed")
#LeaveType.create(:name => "Trainee")







Emptype.create(:name => "probated")
Emptype.create(:name => "confirmed")
Emptype.create(:name => "Trainee")

user =  User.new(:email => 'mahinder124@gmail.com', :password => 'rorteam', :password_confirmation => 'rorteam')
 user.ecode = 'e0001'
 user.name = "mahi"
 user.date_of_joining = "10-12-2001"
 user.date_of_birth = "10-12-2000"
user.role = "admin"
 user.save!
