class ChangeDataTitle < ActiveRecord::Migration[5.0]
  def up
    change_column :products, :size_id, :string
  end
end
