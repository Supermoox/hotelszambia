class AddAttachmentImageToWallpapers < ActiveRecord::Migration[5.1]
  def self.up
    change_table :wallpapers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :wallpapers, :image
  end
end
