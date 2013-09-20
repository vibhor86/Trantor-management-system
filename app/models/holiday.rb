# == Schema Information
#
# Table name: holidays
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  date        :date
#  day         :string(255)
#  remark      :text
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Holiday < ActiveRecord::Base
  
  attr_accessible :name, :description, :date, :day, :remark
  
  validates :name, :date, :day, :presence => true
end
