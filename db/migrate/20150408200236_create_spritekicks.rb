class CreateSpritekicks < ActiveRecord::Migration
  def change
    create_table :spritekicks do |t|
      t.string :title
      t.string :author
      t.text :description
      t.string :url

      t.timestamps null: false
    end
  end
end
