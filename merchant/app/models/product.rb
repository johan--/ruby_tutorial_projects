class Product < ActiveRecord::Base
  has_many :order_items

  validates :title, :price, :description, presence: true
  validates_numericality_of :price
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
