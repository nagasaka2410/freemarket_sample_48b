class ChangeDatatypeMobilePhoneOfUserDetails < ActiveRecord::Migration[5.0]
  def change
    change_column :user_details, :mobile_phone, :string
  end
end
