class AddColumnToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :bu, :string
    add_column :users, :bu_head, :string
    add_column :users, :bank_address, :string
    add_column :users, :bank_ifsc, :string
    add_column :users, :lta_option, :string
    add_column :users, :madical_reimbursement_option, :string
    add_column :users, :pf_no, :string
    add_column :users, :pf_enrollment_date, :date
    add_column :users, :esi_no, :string
    add_column :users, :gpa_option, :string
  end
end
