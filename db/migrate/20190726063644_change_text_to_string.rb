class ChangeTextToString < ActiveRecord::Migration[5.0]
  def up
    change_column :images, :name, :string
  end
end
