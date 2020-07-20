class AddAccommodationIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :accommodation_id, :integer
  end
end
