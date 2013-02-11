class CreateLeavemanagements < ActiveRecord::Migration
  def change
    create_table :leavemanagements do |t|
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.string :reason
      t.string :type
      t.boolean :approved , :default => false
      t.timestamps
    end
  end
end
