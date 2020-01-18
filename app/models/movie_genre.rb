# frozen_string_literal: true

class MovieGenre < ApplicationRecord
  self.table_name = 'movies_genres'
  # validations
  validates :movie_id, presence: true
  validates :genre_id, presence: true

  # associations
  belongs_to :movie
  belongs_to :genre
end
