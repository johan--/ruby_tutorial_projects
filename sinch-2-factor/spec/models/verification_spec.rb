require 'rails_helper'

RSpec.describe Verification, type: :model do
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:code) }
end
