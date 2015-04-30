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
end
