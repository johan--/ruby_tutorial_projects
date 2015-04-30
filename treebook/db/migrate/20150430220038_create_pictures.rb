class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :album, index: true, foreign_key: true
      t.string :caption
      t.text :description
      t.attachment :pictures, :asset

      t.timestamps null: false
    end
  end
end
