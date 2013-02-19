class CreateAbsents < ActiveRecord::Migration
  def change
    create_table :absents do |t|
      t.string :ecode
      t.datetime  :date
      t.timestamps
    end
  end
end
