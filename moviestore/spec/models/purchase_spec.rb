require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { should belong_to :movie }
  it { should belong_to(:buyer).class_name('User') }
end
