class CreateBanks < ActiveRecord::Migration
  
  def change
    create_table :banks do |t|
      t.string :name
      t.string :code
      t.text :address
      t.string :ifsc_code
      t.string :contact_person
      t.string :contact_number
      t.boolean :activated
      t.integer :updater_id
      t.timestamps
    end
  end
  
end
