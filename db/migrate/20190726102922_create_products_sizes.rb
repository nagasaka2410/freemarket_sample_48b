class CreateProductsSizes < ActiveRecord::Migration[5.0]
  def change
    create_table :products_sizes do |t|
      t.string :size
      t.string :ancestry
      t.timestamps
    end
  end
end
