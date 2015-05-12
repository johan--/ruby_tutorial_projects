require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:accounts).through(:memberships) }

  it 'valid factory' do
    expect(user).to be_valid
  end
end
