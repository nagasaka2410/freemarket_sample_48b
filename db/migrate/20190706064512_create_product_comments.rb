class CreateProductComments < ActiveRecord::Migration[5.0]
  def change
    create_table :product_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
