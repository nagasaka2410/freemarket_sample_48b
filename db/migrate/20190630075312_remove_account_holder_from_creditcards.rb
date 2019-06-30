class RemoveAccountHolderFromCreditcards < ActiveRecord::Migration[5.0]
  def up
    remove_column :creditcards, :account_holder, :string
  end

  def down
    add_column :creditcards, :account_holder, :string
  end
end
