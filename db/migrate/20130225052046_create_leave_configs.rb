class CreateLeaveConfigs < ActiveRecord::Migration
  def change
    create_table :leave_configs do |t|
      t.integer :emptype_id
      t.integer :leave_type_id
      t.integer :count
      t.integer :max
      t.integer :factor

      t.timestamps
    end
  end
end
