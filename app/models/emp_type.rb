class EmpType < ActiveRecord::Base
  
  attr_accessible :title, :remark
  
  validates :title, :presence => true, :uniqueness => true
  
end
