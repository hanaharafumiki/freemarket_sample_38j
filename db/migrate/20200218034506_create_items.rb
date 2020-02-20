class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string "name"
      t.integer "price"
      t.integer "status"
      t.string "description"
      t.string "charge"
      t.string "area"
      t.string "day"
      t.integer "sale"
      t.timestamps
    end
  end
end