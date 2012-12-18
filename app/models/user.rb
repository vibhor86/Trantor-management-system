class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_one :designation
  has_one :band
  has_one :photo
  has_many :user_projects
  has_many :projects, :through => :user_projects
  has_many :subordinates, :class_name => "User", :foreign_key => "manager_id"
  belongs_to :manager, :class_name => "User"
end
