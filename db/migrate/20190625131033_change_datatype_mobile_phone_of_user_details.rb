class ChangeDatatypeMobilePhoneOfUserDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_details, :telephone, :mobile_phone 
    change_column :user_details, :mobile_phone, :string
  end
end
