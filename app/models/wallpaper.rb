class Wallpaper < ApplicationRecord
  belongs_to :accommodation


  has_attached_file :image, styles: { large: "760x300>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
