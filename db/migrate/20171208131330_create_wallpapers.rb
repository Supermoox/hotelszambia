class CreateWallpapers < ActiveRecord::Migration[5.1]
  def change
    create_table :wallpapers do |t|
      t.string :name
      t.references :accommodation, foreign_key: true

      t.timestamps
    end
  end
end
