class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :spritekicks, :categories, :categorie
  end
end
