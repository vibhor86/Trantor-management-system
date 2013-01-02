class User < ActiveRecord::Base
  audited
  devise :database_authenticatable, 
    :recoverable, :rememberable, :trackable, :validatable,:registerable, :confirmable

  attr_accessible :email, :password, :password_confirmation,:confirmation_status,:designation_id,:project_id, :remember_me ,:ecode,:name, :date_of_joining, :band_id, :gender, :location, :manager_ecode, :blood_group, :date_of_birth, :marital_status, :date_of_anniversary, :pan_no, :bank_detail, :father_name, :spouse_name, :salary
  validates  :email,:ecode , :presence => true , :uniqueness => true
  validates  :name ,:date_of_joining,:date_of_birth, :presence => true
  validate :date_of_joining , :validate_joining_date_before_birth_date

  belongs_to :band
  belongs_to :project
  belongs_to :designation
  belongs_to :manager, :class_name => :user
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

 def validate_joining_date_before_birth_date
    if date_of_joining && date_of_birth
      errors.add(:date_of_joining, "should be more than D.O.B") if date_of_joining < date_of_birth
    end
  end

end
