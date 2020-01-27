# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :email, presence: true

  # associations
  has_many :movies
  after_create :assign_default_role

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
