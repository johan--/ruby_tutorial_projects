require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:email_address) { EmailAddress.new(address: 'email@example.com', contact_id: person.id, contact_type: 'Person') }

  it { should belong_to(:contact) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:contact_id) }

  it 'is valid' do
    expect(email_address).to be_valid
  end
end
