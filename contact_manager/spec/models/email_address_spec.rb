require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Fabricate(:person) }
  let(:email_address) { Fabricate(:email_address) }

  it { should belong_to(:contact) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:contact_id) }

  it 'is valid' do
    expect(email_address).to be_valid
  end
end
