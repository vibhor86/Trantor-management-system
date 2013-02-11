class CreateEmptypes < ActiveRecord::Migration
  def change
    create_table :emptypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
