class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.text :description
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
