class Designation < ActiveRecord::Base
  
  attr_accessible :name, :description, :activated
  
  validates :name, :uniqueness => true, presence: true
  
end
