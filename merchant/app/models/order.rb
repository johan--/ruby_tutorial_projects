class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :address
  has_many :order_items, dependent: :destroy

  validates_presence_of :user_id
  validates_presence_of :status

  def total
    order_items.inject(0) {|sum, i| sum + i.subtotal}
  end
end
