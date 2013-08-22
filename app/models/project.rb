# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  description    :text
#  start_date     :date
#  end_date       :date
#  contact_person :string(255)
#  updater_id     :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Project < ActiveRecord::Base
  
  attr_accessible  :title, :description, :start_date, :end_date, :contact_person 
  
  validates :title, presence: true, uniqueness: true
  
  has_many :projects_users, :dependent => :destroy
  has_many :users, :through => :projects_users, :dependent => :destroy
  
end
