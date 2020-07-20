class CreateImageAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :image_accommodations do |t|
      t.string :name
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
