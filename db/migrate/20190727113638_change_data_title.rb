class ChangeDataTitle < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :size_id, :string
  end
end
