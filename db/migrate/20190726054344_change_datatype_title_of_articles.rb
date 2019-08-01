class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.0]
  def change
    change_column :images, :name, :text
  end
end
