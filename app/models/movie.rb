class Movie < ApplicationRecord
  has_one :county
  has_one :type
  belongs_to :user
  has_and_belongs_to_many :genres, join_table: "movies_genres", foreign_key: "movie_id"
end
