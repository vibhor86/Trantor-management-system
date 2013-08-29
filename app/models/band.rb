# == Schema Information
#
# Table name: bands
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  updater_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Band < ActiveRecord::Base
  
  attr_accessible :name, :description
  
  validates :name, :uniqueness => true, presence: true
  
  has_many :users
  
end