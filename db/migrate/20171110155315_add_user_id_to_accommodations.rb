class AddUserIdToAccommodations < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :user_id, :integer
  end
end
