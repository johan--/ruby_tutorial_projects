require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Fabricate(:person) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  it 'responds with its created email addresses' do
    person.email_addresses.build(address: 'me@example.com')
    expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
  end

  it "convert to a string with last name, first name" do
    expect(person.to_s).to eq "#{person.last_name}, #{person.first_name}"
  end

  it 'is a child of the user' do
    expect(person.user).to be_instance_of(User)
  end
end
