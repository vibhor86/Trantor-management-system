class CreatePlaceholders < ActiveRecord::Migration
  def change
    
    create_table :placeholders do |t|
      t.string :column_name
      t.string :placeholder_name
      t.timestamps
    end
    
  end
end
