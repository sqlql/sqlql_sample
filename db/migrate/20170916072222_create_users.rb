class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :key, null: false
      t.boolean :privacy, null: false, default: false

      t.timestamps
    end
  end
end
