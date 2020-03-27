class Order < ApplicationRecord
  validates_presence_of :address_id,:order_price
  validates_numericality_of :order_price
  has_many :order_products,dependent: :destroy
end
