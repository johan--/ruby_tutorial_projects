require 'rails_helper'

RSpec.describe Topic, type: :model do
  it { should have_many(:votes).dependent(:destroy) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
