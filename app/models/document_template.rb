class DocumentTemplate < ActiveRecord::Base
  attr_accessible :body, :title
  
  validates :title, :body, :presence => true
  validates :title, :uniqueness => true
  has_one :placeholder
end
