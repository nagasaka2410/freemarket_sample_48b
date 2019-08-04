class AddShippingRegionToProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :shipping_region, :string
  end
end
