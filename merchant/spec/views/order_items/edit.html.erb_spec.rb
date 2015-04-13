require 'rails_helper'

RSpec.describe "order_items/edit", type: :view do
  let(:product) { Product.create(title: "Durion", price: 5.95, description: "Very strong smell", stock: 5) }

  before(:each) do
    @order_item = assign(:order_item, OrderItem.create!(
      :product_id => product.id,
      :order_id => 1,
      :quantity => 1
    ))
  end

  it "renders the edit order_item form" do
    render

    assert_select "form[action=?][method=?]", order_item_path(@order_item), "post" do

      assert_select "input#order_item_quantity[name=?]", "order_item[quantity]"
    end
  end
end
