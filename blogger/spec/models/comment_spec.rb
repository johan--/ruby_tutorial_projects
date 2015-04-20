require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { Fabricate(:comment) }

  it { should belong_to(:article) }

  it 'is valid' do
    expect(comment).to be_valid
  end
end
