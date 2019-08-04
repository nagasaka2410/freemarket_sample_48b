class RenameDateColumn < ActiveRecord::Migration[5.0]
  def up
    rename_column :products, :product_size, :product_size_id
  end
end
