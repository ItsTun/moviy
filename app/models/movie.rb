# frozen_string_literal: true

class Movie < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]
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
  has_one_attached :thumbnail
  has_and_belongs_to_many :genres, join_table: 'movies_genres', foreign_key: 'movie_id'
  accepts_nested_attributes_for :videos, :allow_destroy => true

  def thumbnail_variants
    { thumb: { resize: '100x100' },
      medium: { resize: '300x300' },
      large: { resize: '1000x500' }
    }
  end

  def precalculated_id
    if self.class.unscoped.order('id DESC').first.nil?
      '000001'
    else
      (self.class.unscoped.order('id DESC').first.id + 1).to_s.rjust(6, '0')
    end
  end

  def slug_candidates
    [%i[name precalculated_id]]
  end
end
