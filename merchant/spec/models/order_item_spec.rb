require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  let(:product) { Product.create(title: "Durion", price: 5.95, description: "Very strong smell", stock: 5) }
  let(:order_item) { OrderItem.create( order_id: 1, product_id: product.id, quantity: 2 )}

  it { should belong_to(:order) }
  it { should belong_to(:product) }
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:product_id) }
  it { should validate_numericality_of(:quantity).only_integer }
  it { should validate_numericality_of(:quantity).is_greater_than(0) }

  it 'is valid' do
    expect(order_item).to be_valid
  end

  it 'subtotal method gives the correct calculated price' do
    expect(order_item.subtotal).to eq(11.90)
  end
end
