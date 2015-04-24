class ResolveError < ActiveRecord::Migration
  def change
    remove_column :spritekicks, :categories
  end
end
