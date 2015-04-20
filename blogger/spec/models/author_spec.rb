require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { Fabricate(:author) }

  it 'is valid' do
    expect(author).to be_valid
  end
end
