class AddPrefectureToUserAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :user_addresses, :telephone, :string
    add_column :user_addresses, :prefecture, :string
  end
end
