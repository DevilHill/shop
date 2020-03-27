class SmallCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  validates_presence_of :small_title
end
