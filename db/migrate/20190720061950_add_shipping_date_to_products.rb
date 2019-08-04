class AddShippingDateToProducts < ActiveRecord::Migration[5.0]
  def up
    add_column :products, :shipping_date, :string
  end
end
