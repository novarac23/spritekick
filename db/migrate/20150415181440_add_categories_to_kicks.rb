class AddCategoriesToKicks < ActiveRecord::Migration
  def change
    add_column :spritekicks, :categories, :string 
  end
end
