require 'rails_helper'

RSpec.describe Movie, type: :model do
  it { should have_many :purchases }
  it { should have_many(:buyers).through(:purchases) }
end
