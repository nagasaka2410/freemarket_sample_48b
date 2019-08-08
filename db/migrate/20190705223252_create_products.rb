class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true
      t.integer :status, default: 0, null: false, limit: 1
      t.integer :price, null: false
      t.string :condition, null: false
      t.string :product_size
      t.string :shipping_method, null: false
      t.integer :shipping_burden, null: false
      t.integer :buyer_id
      t.timestamps
    end
  end
end
