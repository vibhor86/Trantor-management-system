class Leavemanagement < ActiveRecord::Base
  attr_accessible :approved, :end_date, :reason, :start_date, :type, :user_id
end
