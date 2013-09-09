class ChangeHolidayDateColumn < ActiveRecord::Migration
  def up
    change_column :holidays, :date, :date
  end

  def down
    change_column :holidays, :date, :datetime
  end
end
