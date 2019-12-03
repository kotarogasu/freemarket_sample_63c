class AddBrandsIdToItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :brand, foreign_key: true
  end
end
