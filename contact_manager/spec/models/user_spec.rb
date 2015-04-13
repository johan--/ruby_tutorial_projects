require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'find_or_create_by_auth' do
    it { expect(User).to respond_to(:find_or_create_by_auth).with(1).argument }
  end
end
