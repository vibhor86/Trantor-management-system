class Leavebalance < ActiveRecord::Base
  attr_accessible :leave_type_id,:user_id , :balance
  belongs_to :user
  belongs_to :leave_type
end
