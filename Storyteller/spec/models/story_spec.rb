require 'rails_helper'

RSpec.describe Story, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
end
