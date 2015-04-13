class Product < ActiveRecord::Base
  validates :title, :price, :description, presence: true
end
