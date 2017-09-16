class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.text :content, null: false, default: ''
      t.boolean :privacy, null: false, default: false

      t.timestamps
    end
  end
end
