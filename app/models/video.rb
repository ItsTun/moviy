# frozen_string_literal: true

class Video < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :episode, presence: true, numericality: { only_integer: true } 
  validates :movie_id, presence: true, numericality: { only_integer: true } 

  # associations
  belongs_to :movie
  has_one_attached :clip
  has_one_attached :thumbnail
end
