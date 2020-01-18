# frozen_string_literal: true

class Country < ApplicationRecord
  # validations
  validates :name, presence: true

  # associations
  has_many :movies
end