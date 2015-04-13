require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate(:user) }

  describe 'find_or_create_by_auth' do
    it { expect(User).to respond_to(:find_or_create_by_auth).with(1).argument }
  end

  it 'has associated people' do
    expect(user).to respond_to(:people)
  end
end
