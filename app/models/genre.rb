class Genre < ApplicationRecord
  has_and_belongs_to_many :movies, join_table: "movies_genres", foreign_key: "genre_id"
end
