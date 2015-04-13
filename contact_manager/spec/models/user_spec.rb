require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { Fabricate(:user) }

  describe 'find_or_create_by_auth' do
    it { expect(User).to respond_to(:find_or_create_by_auth).with(1).argument }
  end

  it 'has associated people' do
    expect(user).to respond_to(:people)
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
end
