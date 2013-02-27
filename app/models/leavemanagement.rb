class Leavemanagement < ActiveRecord::Base
  attr_accessible :approved, :end_date, :reason, :start_date, :type, :user_id
  validates :start_date, :user_id , :presence => true
end
