class User < ActiveRecord::Base
  audited
  devise :database_authenticatable, 
    :recoverable, :rememberable, :trackable, :validatable,:registerable
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:ecode,:name, :date_of_joining, :band_id, :gender, :location, :manager_id, :blood_group, :date_of_birth, :marital_status, :date_of_anniversary, :pan_no, :bank_detail, :father_name, :spouse_name, :salary
  validates  :email,:ecode , :uniqueness => true
  belongs_to :band
  belongs_to :project
  belongs_to :designation
  belongs_to :manager, :class_name => :user
end
