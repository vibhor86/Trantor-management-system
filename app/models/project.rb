class Project < ActiveRecord::Base

  validates :name, :uniqueness => true
  validates :name,:manager_ecode , presence: true
  attr_accessible  :name ,:manager_ecode
end
