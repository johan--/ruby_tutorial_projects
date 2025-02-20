class Author < ActiveRecord::Base
  validates_presence_of :name
  has_many :books, dependent: :delete_all
end
