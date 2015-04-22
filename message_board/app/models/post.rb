class Post < ActiveRecord::Base
  belongs_to :user
  has_many :replies
  validates_presence_of :title, :content
end
