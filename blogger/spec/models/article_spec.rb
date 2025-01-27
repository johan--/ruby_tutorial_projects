require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:article) { Fabricate(:article) }

  it { should belong_to(:author) }
  it { should have_many(:comments) }
  it { should have_many(:taggings) }
  it { should have_many(:tags).through(:taggings) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
       allowing('image/png', 'image/jpg','image/jpeg').
       rejecting('text/plain', 'text/xml') }

  it 'is valid' do
    expect(article).to be_valid
  end
end
