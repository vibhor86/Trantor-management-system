class CreateEmpTypes < ActiveRecord::Migration
  def change
    create_table :emp_types do |t|
      t.string :title
      t.text :remark
      t.timestamps
    end
    
  end
end
