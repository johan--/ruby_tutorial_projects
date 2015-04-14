require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) { Address.create(line1: "1 Street",
                                 line2: nil,
                                 city: "Nowhere",
                                 state: "ZA",
                                 zip: "12345",
                                 user_id: 1)}

  it { should validate_presence_of(:line1) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:state) }
  it { should validate_presence_of(:zip) }
  it { should validate_presence_of(:zip) }

  it 'is valid' do
    expect(address).to be_valid
  end

  it '#to_s renders correct string when line2 is nil' do
    expect(address.to_s).to eq('1 Street, Nowhere, ZA, 12345')
  end

  it '#to_s renders correct string when line2 is not nil' do
    address.line2 = "Apartment 23"
    expect(address.to_s).to eq('1 Street, Apartment 23, Nowhere, ZA, 12345')
  end
end
