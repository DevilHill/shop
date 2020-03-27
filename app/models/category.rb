class Category < ApplicationRecord
  has_many :small_categories
  validates_presence_of :big_title
end
