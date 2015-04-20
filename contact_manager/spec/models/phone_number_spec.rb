require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:phone_number) { PhoneNumber.new(number: "1112223333", contact_id: person.id, contact_type: 'Person') }

  it { should belong_to(:contact) }
  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:contact_id) }

  it 'is valid' do
    expect(phone_number).to be_valid
  end
end
