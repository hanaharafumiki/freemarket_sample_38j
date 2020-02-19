class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string "name", null: false
      t.integer "price", null: false
      t.integer "status", null: false
      t.string "description", null: false
      t.string "charge", null: false
      t.string "area", null: false
      t.string "day", null: false
      t.integer "sale", null: false
      t.timestamps
    end
  end
end