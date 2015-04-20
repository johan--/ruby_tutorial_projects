require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Fabricate(:person) }
  let(:email_address) { Fabricate(:email_address) }
  let(:email_address_from_company) { Fabricate(:email_address_from_company) }

  it { should belong_to(:contact) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:contact_id) }

  it 'is valid' do
    expect(email_address).to be_valid
  end

  it 'email address from company is valid' do
    expect(email_address_from_company).to be_valid
  end
end
