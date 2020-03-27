class Product < ApplicationRecord
  belongs_to :small_category
  validates_presence_of :name,:note,:price,:small_category_id
  validates_numericality_of :price
  attr_accessor :big_category_id,:hidden_image
  has_many :product_images,:dependent => :destroy
  attr_accessor :photo_cache
  has_many :comments,:dependent => :destroy
  has_many :favorites,:dependent => :destroy
end
