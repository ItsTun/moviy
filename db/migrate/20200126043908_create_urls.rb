class CreateUrls < ActiveRecord::Migration[6.0]
  def up
    create_table :urls do |t|
      t.string :name
      t.integer :video_id
      t.timestamps
    end
  end
end
