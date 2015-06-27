class Match < ActiveRecord::Base
  belongs_to :user
  has_many :players, dependent: :delete_all
end
