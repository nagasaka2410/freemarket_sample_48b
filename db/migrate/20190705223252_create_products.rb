class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.string :status
      t.integer :price
      t.string :condition
      t.string :product_size
      t.string :shippoing_method
      t.integer :shipping_burden
      t.timestamps
    end
  end
end
