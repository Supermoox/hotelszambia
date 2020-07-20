class AddAttachmentImageToImageAccommodations < ActiveRecord::Migration[5.1]
  def self.up
    change_table :image_accommodations do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_accommodations, :image
  end
end
