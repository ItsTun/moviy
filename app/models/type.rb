class Type < ApplicationRecord
  # validations
  validates :name, presence: true

  # associations
  has_many :movies
end
