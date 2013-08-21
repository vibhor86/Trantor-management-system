class CreateHolidays < ActiveRecord::Migration
  def change
    
    create_table :holidays do |t|
      t.string :name
      t.text :description
      t.datetime :date
      t.string :day
      t.text :remark
      t.integer :updater_id
      t.timestamps
    end
    
  end
end
