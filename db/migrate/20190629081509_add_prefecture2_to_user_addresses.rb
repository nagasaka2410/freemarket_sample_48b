class AddPrefecture2ToUserAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :user_addresses, :prefecture, :string, null:false
  end
end
