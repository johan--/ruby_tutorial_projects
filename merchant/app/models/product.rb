class Product < ActiveRecord::Base
  validates :title, :price, :description, presence: true
  validates_numericality_of :price
end
