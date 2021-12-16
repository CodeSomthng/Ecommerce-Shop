class Product < ApplicationRecord
  belongs_to :category
  has_many :carts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :users, through: :carts
  has_one_attached :image, dependent: :destroy
end
