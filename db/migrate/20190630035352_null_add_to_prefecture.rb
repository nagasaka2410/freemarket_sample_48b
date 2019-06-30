class NullAddToPrefecture < ActiveRecord::Migration[5.0]
  def change
    change_column_null :user_addresses, :prefecture, false
  end
end
