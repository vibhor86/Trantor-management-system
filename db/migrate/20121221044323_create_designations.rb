class CreateDesignations < ActiveRecord::Migration
  def change
    
    create_table :designations do |t|
      t.string :name
      t.text :description
      t.boolean :activated
      t.integer :updater_id
      t.timestamps
    end
    
    [:name, :activated].each do |field|
      add_index :designations, field
    end
    
  end
end