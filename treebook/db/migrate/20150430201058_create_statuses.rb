class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :content
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
