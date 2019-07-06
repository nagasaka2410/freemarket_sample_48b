class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :product_size, null: false
      t.string :shippoing_method, null: false
      t.integer :shipping_burden, null: false
      t.timestamps
    end
  end
end
