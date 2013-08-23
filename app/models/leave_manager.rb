# == Schema Information
#
# Table name: leave_managers
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  leave_type_id :integer
#  balance       :integer
#  count         :integer
#  max           :integer
#  factor        :integer
#  creator_id    :integer
#  updater_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LeaveManager < ActiveRecord::Base
  
  attr_accessible :user_id, :leave_type_id, :balance, :count, :max, :factor
  
  validates :user_id, :leave_type_id, :balance, :presence => true
  
  belongs_to :user
  
end
