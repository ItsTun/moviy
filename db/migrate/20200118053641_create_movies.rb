class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :country_id
      t.integer :type_id
      t.integer :user_id
      t.date :release_date
      t.integer :imdb
      t.float :rating
      t.text :description
      t.timestamps
    end
  end
end