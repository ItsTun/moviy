# frozen_string_literal: true

class Genre < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_and_belongs_to_many :movies, join_table: 'movies_genres', foreign_key: 'genre_id'

end
