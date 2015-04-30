require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it { should have_many(:statuses) }

  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:profile_name)}
  it { should validate_uniqueness_of(:profile_name)}

  it { should_not allow_value('ex@mple').for(:profile_name) }
  it { should_not allow_value('ex.ample').for(:profile_name) }
  it { should_not allow_value('exam ple').for(:profile_name) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  it '#to_param calls profile_name' do
    expect(user.to_param).to eq(user.profile_name)
  end

  it '#full_name concatenates first_name and last_name' do
    full = "#{user.first_name} #{user.last_name}"

    expect(user.full_name).to eq(full)
  end
end
