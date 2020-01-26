class AddSlugToType < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :slug, :string
    add_index :types, :slug, unique: true
  end
end
