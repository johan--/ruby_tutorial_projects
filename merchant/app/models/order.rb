class Order < ActiveRecord::Base
  has_many :order_items

  validates_presence_of :user_id
  validates_presence_of :status
end
