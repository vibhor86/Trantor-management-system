class CreateDocumentTemplates < ActiveRecord::Migration
  def change
    create_table :document_templates do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
