class LeaveType < ActiveRecord::Base
  
  attr_accessible :name, :code, :description
  
  validates :name, :presence => true, :uniqueness => true
  
end
