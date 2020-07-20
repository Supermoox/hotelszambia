class AddAttachmentImageToImageRooms < ActiveRecord::Migration[5.1]
  def self.up
    change_table :image_rooms do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_rooms, :image
  end
end
