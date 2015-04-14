class Address < ActiveRecord::Base
  belongs_to :user
  has_many :orders
  validates :line1, :city, :state, :zip, :user_id, presence: true

  def to_s
    [line1, line2, city, state, zip].compact.join(", ")
  end
end
