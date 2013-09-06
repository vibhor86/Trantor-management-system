# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  manager_id             :integer
#  band_id                :integer
#  bank_id                :integer
#  designation_id         :integer
#  emp_type_id            :integer
#  preference_id          :integer
#  ecode                  :string(255)
#  name                   :string(255)
#  email                  :string(255)      not null
#  mobile                 :string(255)
#  gender                 :string(255)
#  father_name            :string(255)
#  spouse_name            :string(255)
#  date_of_birth          :date
#  marital_status         :string(255)
#  date_of_anniversary    :date
#  address                :text
#  date_of_joining        :date
#  blood_group            :string(255)
#  pan_no                 :string(255)
#  pf_no                  :string(255)
#  esi_no                 :string(255)
#  role                   :string(255)
#  salary                 :integer
#  creator                :integer
#  updator                :integer
#  soft_delete            :boolean          default(FALSE)
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string(255)
#  avatar_content_type    :string(255)
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#

class User < ActiveRecord::Base

  audited
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable,:registerable, 
  :confirmable, :async
  attr_accessible :confirmed_at, :password, :password_confirmation, :blood_group, :date_of_birth, :marital_status, :date_of_anniversary, :pan_no, :bank_id, :father_name, :spouse_name,:ecode, :name, :gender, :manager_id, :email, :designation_id, :project_id, :remember_me ,:ecode, :name, :date_of_joining, :band_id, :address, :id ,:role ,:emp_type_id
  
  validates  :ecode, :presence => true, :uniqueness => true
  validates  :name, :emp_type_id, :manager_id, :date_of_joining, :date_of_birth, :presence => true
  
  belongs_to :band
  belongs_to :bank
  belongs_to :designation
  belongs_to :emp_type
  belongs_to :manager, :foreign_key => :manager_id, :class_name => 'User', :dependent => :destroy
    
  has_one :leave_manager
  
  has_many :projects_users, :dependent => :destroy
  has_many :projects, :through => :projects_users, :dependent => :destroy
  
  has_many :absents, :dependent => :destroy
  has_many :leave_applications, :dependent => :destroy
  
  after_create :assign_leave_balance
  
  attr_accessor :create_from_form
  
  ROLES = ["admin","hr","manager","individual"]
  
  has_attached_file :avatar,:styles => { :medium => "300x300>"},:url => "/system/:class/:ecode.:extension",:path => ":rails_root/public/system/:class/:ecode.:extension"
  
  require "ruby-debug"
  
  def pending?
    self.emp_type.title == 'Pending'
  end
  
  def confirmed?
    self.emp_type.title == 'Confirmed'
  end
  
  def probation?
    self.emp_type.title == 'Probation'
  end
  
  def trainee?
    self.emp_type.title == 'Trainee'
  end
  
  def contractual?
    self.emp_type.title == 'Contractual'
  end
  
  def short_name
    name.split(' ').first
  end
  
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end
  
  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # new function to provide access to protected method unless_confirmed
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
  
  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end

  def validate_joining_date_before_birth_date
    if date_of_joining && date_of_birth
      errors.add(:date_of_joining, "should be more than D.O.B") if date_of_joining < date_of_birth
    end
  end
  
  def assign_leave_balance
    for_non_trainee if self.create_from_form && self.emptype.name != "Trainee"
  end  
  
  def for_non_trainee
    remaining_month = 12 - Date.today.strftime("%m").to_i
    balance  = ((7*remaining_month)/12).round
    cl_type =  LeaveType.find_by_name("CL")
    sl_type =  LeaveType.find_by_name("FSL")
    Leavebalance.create(:user_id => self.id , :leave_type_id => cl_type.id , :balance => balance) if cl_type
    Leavebalance.create(:user_id => self.id , :leave_type_id => sl_type.id, :balance => balance) if sl_type
  end 
  
end
