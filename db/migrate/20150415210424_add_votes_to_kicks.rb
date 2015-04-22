class AddVotesToKicks < ActiveRecord::Migration
  def change
    add_column :spritekicks, :votes, :integer
  end
end
