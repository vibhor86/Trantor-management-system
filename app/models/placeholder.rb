class Placeholder < ActiveRecord::Base
  
  attr_accessible :column_name, :placeholder_name
  
  validates :column_name, :placeholder_name, :presence => true, :uniqueness => true
  
end
