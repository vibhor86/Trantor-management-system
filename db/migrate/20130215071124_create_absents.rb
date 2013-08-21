class CreateAbsents < ActiveRecord::Migration
  def change
    create_table :absents do |t|
      
      t.integer :user_id
      t.date  :date_of_absence
      t.integer :creator_id
      t.integer :updater_id
      t.timestamps
      
    end
  end
end
