class AddTelephoneToUserAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :user_addresses, :telephone, :string
  end
end
