require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:membership) { create(:membership) }

  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:user) }

  it 'valid factory' do
    expect(membership).to be_valid
  end
end
