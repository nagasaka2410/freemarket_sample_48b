class AddPrefectureToUserAddresses < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_addresses, :prefecture, foreign_key: true
  end
end
