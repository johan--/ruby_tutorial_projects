class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
