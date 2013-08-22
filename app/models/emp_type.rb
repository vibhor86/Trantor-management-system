# == Schema Information
#
# Table name: emp_types
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  remark     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EmpType < ActiveRecord::Base
  
  attr_accessible :title, :remark
  
  validates :title, :presence => true, :uniqueness => true
  
  has_many :users, :dependent => :destroy

end
