# == Schema Information
#
# Table name: leave_applications
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  leave_type_id :integer
#  start_date    :date
#  end_date      :date
#  reason        :text
#  approved      :boolean
#  creator_id    :integer
#  updater_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class LeaveApplication < ActiveRecord::Base
  
  attr_accessible :user_id, :leave_type_id, :start_date, :end_date, :reason, :approved
  
  validates :user_id, :leave_type_id, :start_date, :end_date, :reason, :presence => true
  
  belongs_to :user
  
end
