class CreateLeaveApplications < ActiveRecord::Migration
  def change
    
    create_table :leave_applications do |t|
      t.integer :user_id
      t.integer :leave_type_id
      t.date :start_date
      t.date :end_date
      t.text :reason
      t.boolean :approved
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps
    end
    
    add_index :leave_applications, :user_id
    add_index :leave_applications, :leave_type_id
    
  end
end