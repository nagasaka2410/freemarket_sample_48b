class ChangeDatatypeShippingBurdenOfProducts < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :shipping_burden, :string
  end
end
