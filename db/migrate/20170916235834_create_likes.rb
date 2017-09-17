class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, null: false
      t.references :comment, foreign_key: true, null: false

      t.timestamps
    end
  end
end
