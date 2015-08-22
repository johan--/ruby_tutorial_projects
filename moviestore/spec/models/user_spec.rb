require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :purchases }
  it { should have_many(:movies).through(:purchases) }
end
