class Accommodation < ApplicationRecord
  belongs_to :category
  belongs_to :city
  has_many :rooms, dependent: :destroy
  belongs_to :user
  has_many :wallpapers, dependent: :destroy
  has_many :reviews

  accepts_nested_attributes_for :rooms, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :wallpapers, allow_destroy: true, reject_if: :all_blank
end
