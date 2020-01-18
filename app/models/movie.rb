class Movie < ApplicationRecord
  belongs_to :country
  belongs_to :type
  belongs_to :user
  has_many :videos
  has_and_belongs_to_many :genres, join_table: "movies_genres", foreign_key: "movie_id"
end
