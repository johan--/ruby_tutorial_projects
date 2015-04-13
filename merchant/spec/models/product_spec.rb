require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { Product.create(title: "Durion", price: 5.95, description: "Very strong smell", stock: 5) }

  it { should have_many(:order_items) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:description) }
  it { should validate_numericality_of(:price) }
  it { should validate_numericality_of(:stock) }

  it 'is valid' do
    expect(product).to be_valid
  end

  it 'should not accept negative stock numbers' do
    product.stock = -5
    expect(product).to_not be_valid
  end

  it 'should not accept float stock numbers' do
    product.stock = 5.05
    expect(product).to_not be_valid
  end
end
