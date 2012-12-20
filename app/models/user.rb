class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :ecode, :email, :password, :password_confirmation, :remember_me,
    :name, :role
  # attr_accessible :title, :body
  validates_presence_of :ecode
  validates_uniqueness_of :ecode
  
  has_one :designation
  has_one :band
  has_one :photo
  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :subordinates, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "User"

  ROLES = %w[admin hr manager employee]

  ROLES.each do |role|
    define_method "#{role}?" do
      self.role == role
    end
  end
  
end
