class Project < ActiveRecord::Base

  validates :name, :uniqueness => true
  validates :name, presence: true
  attr_accessible  :name ,:manager_ecode
end
