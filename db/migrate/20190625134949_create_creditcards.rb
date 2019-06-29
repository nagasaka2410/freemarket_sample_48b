class CreateCreditcards < ActiveRecord::Migration[5.0]
  def change
    create_table :creditcards do |t|
      t.references :user, null:false, foreign_key: true
      t.string :account_holder, null:false
      t.string :card_number, null:false
      t.integer :valid_month,	null:false
      t.integer :valid_year,	null:false
      t.string :security_code,	null:false
      t.timestamps
    end
  end
end
