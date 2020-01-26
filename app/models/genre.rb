# frozen_string_literal: true

class Genre < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_and_belongs_to_many :movies, join_table: 'movies_genres', class_name: 'Movie', association_foreign_key: 'movie_id', foreign_key: 'genre_id'
  
  def slug_candidates
    [%i[name]]
  end

end
