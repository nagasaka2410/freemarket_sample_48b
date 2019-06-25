class RenameTelephoneColumnToUserDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_details, :telephone, :mobile_phone 
  end
end
