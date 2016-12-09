class CartedProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: {greater_than: 0}
end
