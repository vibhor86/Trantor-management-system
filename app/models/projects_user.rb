# == Schema Information
#
# Table name: projects_users
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  project_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProjectsUser < ActiveRecord::Base
  
  attr_accessible :user_id, :project_id
  
  validates :user_id, :project_id, :presence => true
  validates :user_id, :uniqueness => {:scope => :project_id}
  
  belongs_to :user
  belongs_to :project
  
end
