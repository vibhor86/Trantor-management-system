class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users,:acc_number,:string
  end
end
