class Absent < ActiveRecord::Base
  
   attr_accessible :user_id, :date_of_absence
   
   validates :user_id, :date_of_absence, presence: true
   
end
