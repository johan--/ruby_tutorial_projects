require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should have_many(:taggings) }
end
