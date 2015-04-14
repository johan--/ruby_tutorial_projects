require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :user_id => 1
      ),
      Address.create!(
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :user_id => 1
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Line1".to_s, :count => 2
    assert_select "tr>td", :text => "Line2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
