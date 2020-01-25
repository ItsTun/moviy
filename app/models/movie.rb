# frozen_string_literal: true

class Movie < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :country_id, presence: true, numericality: { only_integer: true }
  validates :type_id, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }

  # associations
  belongs_to :country
  belongs_to :type
  belongs_to :user
  has_many :videos
  has_and_belongs_to_many :genres, join_table: 'movies_genres', foreign_key: 'movie_id'
  accepts_nested_attributes_for :videos, :allow_destroy => true
end
