class Product < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search, against: :title,
                           using: {
                             tsearch: { prefix: true }
                           }

  belongs_to :category

  has_many :carts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :carts
  has_one_attached :image, dependent: :destroy
end
