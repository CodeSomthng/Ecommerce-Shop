# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %i[admin moderator registered_user banned].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
end
