class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false, limit: 1
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :product_size, null: false
      t.string :shipping_method, null: false
      t.integer :shipping_burden, null: false
      t.timestamps
    end
  end
end
