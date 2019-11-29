class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :item_text
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :delivery_fee, null: false
      t.string :delivery_method
      t.string :days, null: false
      t.string :prefecture_id, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
