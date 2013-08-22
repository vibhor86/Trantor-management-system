# == Schema Information
#
# Table name: banks
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  code           :string(255)
#  address        :text
#  ifsc_code      :string(255)
#  contact_person :string(255)
#  contact_number :string(255)
#  activated      :boolean
#  updater_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Bank < ActiveRecord::Base
  
  attr_accessible :name, :code, :address, :ifsc_code, :contact_person, :contact_number, :activated
  
  validates :name, :uniqueness => true, presence: true
  
  has_many :users
  
end
