require 'rails_helper'

RSpec.describe Author, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:books).dependent(:delete_all) }
end
