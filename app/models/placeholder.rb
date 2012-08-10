class Placeholder < ActiveRecord::Base
  
  validates :column_name, :placeholder_name, :presence => true, :uniqueness => true
  attr_accessible :column_name, :placeholder_name
  belongs_to :document_template
  
end
