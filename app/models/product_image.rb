class ProductImage < ApplicationRecord
  belongs_to :product
  validates_presence_of :photo
end
