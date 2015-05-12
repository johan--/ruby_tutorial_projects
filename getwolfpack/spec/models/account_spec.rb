require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }

  it { should have_many(:memberships).dependent(:destroy) }
  it { should have_many(:users).through(:memberships) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:subdomain) }
  it { should validate_uniqueness_of(:subdomain) }

  it { should allow_value('prograils').for(:subdomain) }
  it { should allow_value('getwolfpack').for(:subdomain) }
  it { should allow_value('getwolf123').for(:subdomain) }

  it 'factory should be valid' do
    expect(account).to be_valid
  end

  it 'checks invalid subdomains' do
    account.subdomain = ''
    expect(account).to_not be_valid

    account.subdomain = 'ab'
    expect(account).to_not be_valid

    account.subdomain = '---'
    expect(account).to_not be_valid

    account.subdomain = 'ab-'
    expect(account).to_not be_valid

    account.subdomain = '-ab'
    expect(account).to_not be_valid

    account.subdomain = '1abc'
    expect(account).to_not be_valid
  end
end
