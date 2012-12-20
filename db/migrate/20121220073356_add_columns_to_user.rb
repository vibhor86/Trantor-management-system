class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :ecode, :string
  end
end
