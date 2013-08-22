# == Schema Information
#
# Table name: designations
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  activated   :boolean
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Designation < ActiveRecord::Base
  
  attr_accessible :name, :description, :activated
  
  validates :name, :uniqueness => true, presence: true
  
  has_many :users
  
end
