class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :maplink
      t.string :tel
      t.string :email
      t.text :description
      t.references :category, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
