class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :post_number, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :town, null: false
      t.string :building
      t.timestamps
    end
  end
end
