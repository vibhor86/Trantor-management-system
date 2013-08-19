class Project < ActiveRecord::Base
  
  attr_accessible  :name ,:manager_ecode
  
  validates :name, :uniqueness => true
  validates :name,:manager_ecode , presence: true
  
end
