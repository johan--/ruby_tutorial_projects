class Micropost < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates :content, length: { maximum: 140 }, presence: true
end
