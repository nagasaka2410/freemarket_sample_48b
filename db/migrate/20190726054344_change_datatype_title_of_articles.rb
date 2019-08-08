class ChangeDatatypeTitleOfArticles < ActiveRecord::Migration[5.0]
  def up
    change_column :images, :name, :text
  end
end
