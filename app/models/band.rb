class Band < ActiveRecord::Base
  
  attr_accessible :name, :description
  
  validates :name, :uniqueness => true, presence: true
  
end
