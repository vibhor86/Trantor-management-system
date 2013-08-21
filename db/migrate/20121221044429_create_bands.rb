class CreateBands < ActiveRecord::Migration
  
  def change
    create_table :bands do |t|
      t.string :name
      t.text :description
      t.integer :updater_id
      t.timestamps
    end
    
    add_index :bands, :name
    
  end
  
end
