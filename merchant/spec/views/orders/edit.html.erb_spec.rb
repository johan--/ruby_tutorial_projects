require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :user_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_status[name=?]", "order[status]"
    end
  end
end
