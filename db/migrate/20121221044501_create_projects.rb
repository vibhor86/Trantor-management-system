class CreateProjects < ActiveRecord::Migration
  def change
    
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.string :contact_person
      t.integer :updater_id
      t.timestamps
    end
    
    [:title, :start_date, :end_date].each do |field|
      add_index :projects, field
    end
    
  end
end
