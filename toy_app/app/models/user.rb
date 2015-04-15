class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  validates_presence_of :name, :email
end
