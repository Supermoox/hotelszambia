class CreateImageRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :image_rooms do |t|
      t.string :name
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
