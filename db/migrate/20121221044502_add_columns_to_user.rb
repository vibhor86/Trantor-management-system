class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |u|
      u.confirmable
    end

    User.update_all({:confirmed_at => DateTime.now, :confirmation_token => "Grandfathered Account", :confirmation_sent_at => DateTime.now})
  end
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
    add_column :users, :bank_number, :string
    add_column :users, :date_of_anniversary, :date
    add_column :users, :date_of_birth, :date
    add_column :users, :photo_id, :integer
    add_column :users, :manager_ecode, :string
    add_column :users, :location, :text
    add_column :users, :band_id, :integer 
    add_column :users, :date_of_joining, :date
    add_column :users, :designation_id, :integer 
    add_column :users, :bank_id, :integer 
    add_column :users, :project_id, :integer 
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    add_column :users, :emptype_id, :integer
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :users, :confirmation_token, :unique => true
    # User.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    User.update_all(:confirmed_at => Time.now)
     
  end
end
