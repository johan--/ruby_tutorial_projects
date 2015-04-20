class Person < ActiveRecord::Base
  include Contact

  belongs_to :user

  validates_presence_of :first_name, :last_name

  def to_s
    "#{last_name}, #{first_name}"
  end
end
