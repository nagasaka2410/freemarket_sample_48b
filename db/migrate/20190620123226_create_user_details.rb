class CreateUserDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :user_details do |t|
      t.references :user, null:false, foreign_key: true
      t.string :last_name, null:false
      t.string :first_name, null:false
      t.string :last_name_kana, null:false
      t.string :first_name_kana, null:false
      t.integer :birth_year, null:false
      t.integer :birth_month, null:false
      t.integer :birth_day, null:false
      t.integer :telephone, null:false
      t.timestamps
    end
  end
end
