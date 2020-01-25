class Type < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: %i[slugged finders]
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_many :movies

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
