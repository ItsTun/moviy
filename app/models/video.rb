# frozen_string_literal: true

class Video < ApplicationRecord
  # validations
  validates :name, presence: true
  validates :episode, presence: true, numericality: { only_integer: true } 
  validates :movie_id, presence: true, numericality: { only_integer: true } 

  # associations
  belongs_to :movie
end
