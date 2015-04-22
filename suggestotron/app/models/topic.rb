class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  validates_presence_of :title, :description
end
