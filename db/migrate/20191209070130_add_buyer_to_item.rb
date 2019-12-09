class AddBuyerToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :Buyer, foreign_key: true
  end
end
