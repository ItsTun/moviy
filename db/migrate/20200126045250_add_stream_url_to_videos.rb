class AddStreamUrlToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :stream_url, :string
    remove_column :videos, :name, :string
  end
end
