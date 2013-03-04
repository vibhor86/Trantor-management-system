class LeaveType < ActiveRecord::Base
  attr_accessible :name
  validates :name , :uniqueness => true
end
