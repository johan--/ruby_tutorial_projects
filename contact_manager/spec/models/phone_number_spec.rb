require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) { Fabricate(:person) }
  let(:phone_number) { Fabricate(:phone_number) }
  let(:phone_number_from_company) { Fabricate(:phone_number_from_company) }

  it { should belong_to(:contact) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:contact_id) }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'phone number from company is valid' do
    expect(phone_number_from_company).to be_valid
  end
end
