require 'rails_helper'

RSpec.describe "addresses/edit", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :line1 => "MyString",
      :line2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_line1[name=?]", "address[line1]"

      assert_select "input#address_line2[name=?]", "address[line2]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_zip[name=?]", "address[zip]"

      assert_select "input#address_user_id[name=?]", "address[user_id]"
    end
  end
end
