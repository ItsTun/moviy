class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :name
      t.integer :episode
      t.integer :movie_id
    end
  end
end
