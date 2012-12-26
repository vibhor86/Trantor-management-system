class User < ActiveRecord::Base 
audited
  devise :database_authenticatable, 
    :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:ecode
end
