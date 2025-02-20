require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :user_id => 1,
      :status => "MyString"
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input#order_user_id[name=?]", "order[user_id]"

      assert_select "input#order_status[name=?]", "order[status]"
    end
  end
end
