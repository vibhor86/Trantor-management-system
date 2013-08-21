class CreateLeaveManagers < ActiveRecord::Migration
  def change
    
    create_table :leave_managers do |t|
      t.integer :user_id
      t.integer :leave_type_id
      t.integer :balance
      t.integer :count
      t.integer :max
      t.integer :factor
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps
    end
    
    add_index :leave_managers, :user_id
    
  end
end
