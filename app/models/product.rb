class Product < ApplicationRecord

  belongs_to :supplier
  belongs_to :user
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories


end
