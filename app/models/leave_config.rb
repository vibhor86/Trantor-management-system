class LeaveConfig < ActiveRecord::Base
  attr_accessible :count, :emptype_id, :leave_type_id, :max
  validates :emptype_id , :leave_type_id,:count ,:max ,:presence => true
  
  
  
end
