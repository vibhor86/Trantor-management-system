class Bank < ActiveRecord::Base
  
  attr_accessible :name, :code, :address, :ifsc_code, :contact_person, :contact_number, :activated
  
  validates :name, :uniqueness => true, presence: true
  
end
