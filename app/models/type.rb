class Type < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_many :movies
end
