# frozen_string_literal: true

class Video < ApplicationRecord
  # validations
  validates :episode, presence: true, numericality: { only_integer: true } 
  validates :movie_id, presence: true, numericality: { only_integer: true } 

  # associations
  belongs_to :movie
  has_one_attached :clip
  has_many :urls
  accepts_nested_attributes_for :urls, :allow_destroy => true
end
