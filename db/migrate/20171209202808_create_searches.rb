class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.integer :category_id
      t.integer :city_id

      t.timestamps
    end
  end
end
