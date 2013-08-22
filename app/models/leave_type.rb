# == Schema Information
#
# Table name: leave_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  code        :string(255)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LeaveType < ActiveRecord::Base
  
  attr_accessible :name, :code, :description
  
  validates :name, :presence => true, :uniqueness => true
  
end
