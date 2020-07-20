class CreateSearchRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :search_rooms do |t|
      t.decimal :price
      t.decimal :min_price
      t.decimal :max_price
      t.integer :category_id
      t.integer :city_id

      t.timestamps
    end
  end
end
