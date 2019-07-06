class RenameAncestoryColumnToCategories < ActiveRecord::Migration[5.0]
  def change
    rename_column :categories, :ancestory, :ancestry
  end
end
