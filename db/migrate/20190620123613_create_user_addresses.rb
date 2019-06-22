class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null:false, foreign_key: true
      t.integer :postal_code, null:false
      t.string :city, null:false
      t.string :block_number, null:false
      t.string :building
      t.timestamps
    end
  end
end
