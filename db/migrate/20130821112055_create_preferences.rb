class CreatePreferences < ActiveRecord::Migration
  def change
    
    create_table :preferences do |t|
      t.integer :user_id
      t.boolean :lta
      t.boolean :medical_reimbursement
      t.date :pf_enrollment_date
      t.boolean :gpa
      t.timestamps
    end
    
    add_index :preferences, :user_id
    
  end
end
