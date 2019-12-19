class ChangeColumnToImages < ActiveRecord::Migration[5.0]
  def up
    change_column :images, :src, :string, null: true
  end

  # 変更前の状態
  def down
    change_column :images, :src, :string, null: false
  end
end
