class AddIndexToSpritekicks < ActiveRecord::Migration
  def change
    add_column :spritekicks, :user_id, :integer
    add_index :spritekicks, :user_id
  end
end
