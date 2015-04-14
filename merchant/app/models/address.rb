class Address < ActiveRecord::Base
  validates :line1, :city, :state, :zip, :user_id, presence: true
end
