class RenameBuyerIdColumnToItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :Buyer_id, :buyer_id
  end
end
