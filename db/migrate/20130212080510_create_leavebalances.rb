class CreateLeavebalances < ActiveRecord::Migration
  def change
    create_table :leavebalances do |t|
      t.references :user
      t.integer :cl
      t.integer :sl
      t.integer :el
      t.integer :co
      t.timestamps
    end
  end
end
