class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :item_text
      t.integer :price, null: false
      t.integer :condition, null: false
      t.integer :delivery_fee, null: false
      t.integer :delivery_method
      t.integer :days, null: false
      t.integer :prefecture_id, null: false
      t.integer :status, null: false, default: 1
      t.integer :size
      t.integer :fee, null: false
      t.integer :profit, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
