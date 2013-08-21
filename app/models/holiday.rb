class Holiday < ActiveRecord::Base
  
  attr_accessible :name, :description, :date, :day, :remark
  
  validates :name, :date, :day, :presence => true
end
