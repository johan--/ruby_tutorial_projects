require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page){ Page.create(title: 'Hello', body: 'World', slug: 'about') }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  it 'is valid' do
    expect(page).to be_valid
  end

  it 'to_param calls slug' do
    expect(page.to_param).to eq('about')
  end
end
