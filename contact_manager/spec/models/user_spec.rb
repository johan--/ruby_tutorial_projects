require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate(:user) }

  it { should have_many(:people) }
  it { should have_many(:companies) }

  describe 'find_or_create_by_auth' do
    it { expect(User).to respond_to(:find_or_create_by_auth).with(1).argument }
  end

  it 'builds associated people' do
    person_1 = Fabricate(:person)
    person_2 = Fabricate(:person)
    [person_1, person_2].each do |person|
      expect(user.people).not_to include(person)
      user.people << person
      expect(user.people).to include(person)
    end
  end

  it 'builds associated companies' do
    company_1 = Fabricate(:company)
    company_2 = Fabricate(:company)
    [company_1, company_2].each do |company|
      expect(user.companies).not_to include(company)
      user.companies << company
      expect(user.companies).to include(company)
    end
  end
end
