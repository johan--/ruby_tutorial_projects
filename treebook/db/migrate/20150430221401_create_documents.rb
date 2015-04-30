class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_attachment :documents, :attachment
    add_column :statuses, :document_id, :integer
  end
end
