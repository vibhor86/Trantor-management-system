# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130909140114) do

  create_table "absents", :force => true do |t|
    t.integer  "user_id"
    t.date     "date_of_absence"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "bands", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "updater_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "bands", ["name"], :name => "index_bands_on_name"

  create_table "banks", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "address"
    t.string   "ifsc_code"
    t.string   "contact_person"
    t.string   "contact_number"
    t.boolean  "activated"
    t.integer  "updater_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "designations", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "activated"
    t.integer  "updater_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "designations", ["activated"], :name => "index_designations_on_activated"
  add_index "designations", ["name"], :name => "index_designations_on_name"

  create_table "emp_types", :force => true do |t|
    t.string   "title"
    t.text     "remark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "holidays", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "date"
    t.string   "day"
    t.text     "remark"
    t.integer  "updater_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "leave_applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "leave_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "reason"
    t.boolean  "approved"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "leave_applications", ["leave_type_id"], :name => "index_leave_applications_on_leave_type_id"
  add_index "leave_applications", ["user_id"], :name => "index_leave_applications_on_user_id"

  create_table "leave_managers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "leave_type_id"
    t.integer  "balance"
    t.integer  "count"
    t.integer  "max"
    t.integer  "factor"
    t.integer  "creator_id"
    t.integer  "updater_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "leave_managers", ["user_id"], :name => "index_leave_managers_on_user_id"

  create_table "leave_types", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "preferences", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "lta"
    t.boolean  "medical_reimbursement"
    t.date     "pf_enrollment_date"
    t.boolean  "gpa"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "preferences", ["user_id"], :name => "index_preferences_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "contact_person"
    t.integer  "updater_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "projects", ["end_date"], :name => "index_projects_on_end_date"
  add_index "projects", ["start_date"], :name => "index_projects_on_start_date"
  add_index "projects", ["title"], :name => "index_projects_on_title"

  create_table "projects_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects_users", ["user_id", "project_id"], :name => "index_projects_users_on_user_id_and_project_id"

  create_table "users", :force => true do |t|
    t.integer  "manager_id"
    t.integer  "band_id"
    t.integer  "bank_id"
    t.integer  "designation_id"
    t.integer  "emp_type_id"
    t.integer  "preference_id"
    t.string   "ecode"
    t.string   "name"
    t.string   "email",                                                                    :null => false
    t.string   "mobile"
    t.string   "gender"
    t.string   "father_name"
    t.string   "spouse_name"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.date     "date_of_anniversary"
    t.text     "address"
    t.date     "date_of_joining"
    t.string   "blood_group"
    t.string   "pan_no"
    t.string   "pf_no"
    t.string   "esi_no"
    t.string   "role"
    t.decimal  "salary",                 :precision => 10, :scale => 0
    t.integer  "creator"
    t.integer  "updator"
    t.boolean  "soft_delete",                                           :default => false
    t.string   "encrypted_password",                                    :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                                               :null => false
    t.datetime "updated_at",                                                               :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["band_id"], :name => "index_users_on_band_id"
  add_index "users", ["bank_id"], :name => "index_users_on_bank_id"
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["designation_id"], :name => "index_users_on_designation_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["emp_type_id"], :name => "index_users_on_emp_type_id"
  add_index "users", ["manager_id"], :name => "index_users_on_manager_id"
  add_index "users", ["preference_id"], :name => "index_users_on_preference_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
