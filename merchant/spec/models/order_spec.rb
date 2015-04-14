require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:order_items) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:status) }
end
