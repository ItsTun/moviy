# frozen_string_literal: true

class Country < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_many :movies

  def slug_candidates
    [%i[name]]
  end
end
