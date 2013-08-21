class Project < ActiveRecord::Base
  
  attr_accessible  :title, :description, :manager_id, :start_date, :end_date, :contact_person 
  
  validates :title, uniqueness: true
  validates :title, :manager_id, presence: true
  
end
