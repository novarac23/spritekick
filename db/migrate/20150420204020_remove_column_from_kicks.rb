class RemoveColumnFromKicks < ActiveRecord::Migration
  def change
    remove_column :spritekicks, :voted
  end
end
