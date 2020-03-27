class Comment < ApplicationRecord
  belongs_to :product
  validates_numericality_of :score
  validates_presence_of :content

end
