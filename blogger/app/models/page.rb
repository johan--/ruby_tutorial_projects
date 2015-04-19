class Page < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  def to_param
    slug
  end

  # def self.find(slug)
  #   find_by_slug(slug)
  # end
end
