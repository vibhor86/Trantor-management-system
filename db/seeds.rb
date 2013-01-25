# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
 user =  User.new(:email => 'mahinder124@gmail.com', :password => 'rorteam', :password_confirmation => 'rorteam')
 user.ecode = 'e0001'
 user.name = "mahi"
 user.date_of_joining = "10-12-2001"
 user.date_of_birth = "10-12-2000"
 user.save!
 
