# == Schema Information
#
# Table name: placeholders
#
#  id               :integer          not null, primary key
#  column_name      :string(255)
#  placeholder_name :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Placeholder < ActiveRecord::Base
  
  attr_accessible :column_name, :placeholder_name
  
  validates :column_name, :placeholder_name, :presence => true, :uniqueness => true
  
end
