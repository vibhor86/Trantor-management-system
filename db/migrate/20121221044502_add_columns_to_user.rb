class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :ecode, :string
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :confirmation_status, :string , :default => "pending"
    add_column :users, :blood_group, :string
    add_column :users, :marital_status, :string
    add_column :users, :pan_no, :string
    add_column :users, :father_name, :string
    add_column :users, :spouse_name, :string
    add_column :users, :salary, :decimal
    add_column :users, :bank_detail, :text
    add_column :users, :date_of_anniversary, :date
    add_column :users, :date_of_birth, :date
    add_column :users, :photo_id, :integer
    add_column :users, :manager_ecode, :string
    add_column :users, :location, :text
    add_column :users, :band_id, :integer 
    add_column :users, :date_of_joining, :date
    add_column :users, :designation_id, :integer 
    add_column :users, :project_id, :integer 
   
     
  end
end
