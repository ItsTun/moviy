# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :email, presence: true

  # associations
  has_many :movies

  def self.from_fb(auth)
    where(auth[:uid]).first_or_initialize.tap do |user|
      user.uid = auth[:uid]
      user.name = auth[:name]
      user.email = auth[:email]
      user.oauth_token = auth[:oauth_token]
      user.save!
    end
  end
end
