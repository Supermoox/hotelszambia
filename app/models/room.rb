class Room < ApplicationRecord
  belongs_to :accommodation, optional: true
  has_many :image_rooms, dependent: :destroy
  has_many :pictures, dependent: :destroy

  accepts_nested_attributes_for :pictures, allow_destroy: true, reject_if: :all_blank

end
