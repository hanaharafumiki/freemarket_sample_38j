class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :picture, null: false
      t.references :item, null: false, foreign_key: true
    end
  end
end
