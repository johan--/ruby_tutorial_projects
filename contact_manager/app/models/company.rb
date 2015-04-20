class Company < ActiveRecord::Base
  include Contact

  belongs_to :user

  validates_presence_of :name

  def to_s
    name
  end
end
