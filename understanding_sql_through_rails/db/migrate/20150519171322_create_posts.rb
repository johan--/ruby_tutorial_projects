class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, limit: 40
      t.text :content, limit: 3200
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
