require 'rails_helper'

describe Blab do
  it { should validate_presence_of(:content) }
end
