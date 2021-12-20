# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %i[admin moderator visitor banned].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_many :products, through: :carts
end
