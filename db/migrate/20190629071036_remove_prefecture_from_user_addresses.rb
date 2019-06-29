class RemovePrefectureFromUserAddresses < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :user_addresses, :prefectures
    remove_index :user_addresses, :prefecture_id
    remove_reference :user_addresses, :prefecture
  end
end
