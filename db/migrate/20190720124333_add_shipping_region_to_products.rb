class AddShippingRegionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :shipping_region, :string
  end
end
