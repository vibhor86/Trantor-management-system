class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## References
      t.integer :manager_id
      t.integer :band_id
      t.integer :bank_id
      t.integer :designation_id
      t.integer :emp_type_id
      t.integer :preference_id
      
      ## Basic Info
      t.string :ecode
      t.string :name
      t.string :email, :null => false
      t.string :mobile
      t.string :gender
      t.string :father_name
      t.string :spouse_name
      t.date :date_of_birth
      t.string :marital_status
      t.date :date_of_anniversary
      t.text :address
      t.date :date_of_joining
      t.string :blood_group
      t.string :pan_no
      t.string :pf_no
      t.string :esi_no
      t.string :role
      t.decimal :salary
      t.integer :creator
      t.integer :updator
      t.boolean :soft_delete, :default => false
      
      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Token authenticatable
      # t.string :authentication_token

      t.timestamps
    end

    add_index :users, :email, :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token, :unique => true
    [:manager_id, :bank_id, :band_id, :designation_id, :emp_type_id, :preference_id].each do |field|
      add_index :users, field
    end
    
  end
end
