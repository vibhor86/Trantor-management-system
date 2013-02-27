class CreateLeavebalances < ActiveRecord::Migration
  def change
    create_table :leavebalances do |t|
      t.references :user
      t.integer :leave_type_id
      t.integer :balance
      t.timestamps
    end
  end
end
