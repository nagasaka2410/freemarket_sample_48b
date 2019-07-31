class RenameTitreColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :product_size_id, :size_id
  end
end
