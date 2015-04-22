class AddFlagToSpritekicks < ActiveRecord::Migration
  def change
     add_column :spritekicks, :voted, :boolean
  end
end
