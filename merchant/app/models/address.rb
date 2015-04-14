class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  validates :line1, :city, :state, :zip, :user_id, presence: true
end
