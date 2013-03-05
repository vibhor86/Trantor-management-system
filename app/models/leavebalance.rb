class Leavebalance < ActiveRecord::Base
 attr_accessible :leave_type_id, :balance
 belongs_to :leave_type
end
