# == Schema Information
#
# Table name: absents
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  date_of_absence :date
#  creator_id      :integer
#  updater_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Absent < ActiveRecord::Base
  
   attr_accessible :user_id, :date_of_absence
   
   validates :user_id, :date_of_absence, presence: true
   
   belongs_to :user
   
end
