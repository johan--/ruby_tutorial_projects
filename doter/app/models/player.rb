class Player < ActiveRecord::Base
  belongs_to :match

  serialize :hero
  serialize :items
end
