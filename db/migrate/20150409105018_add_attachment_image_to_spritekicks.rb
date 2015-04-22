class AddAttachmentImageToSpritekicks < ActiveRecord::Migration
  def self.up
    change_table :spritekicks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :spritekicks, :image
  end
end
