require 'rails_helper'

RSpec.describe "replies/new", type: :view do
  before(:each) do
    assign(:reply, Reply.new(
      :content => "MyText",
      :user => nil,
      :post => nil
    ))
  end

  it "renders new reply form" do
    render

    assert_select "form[action=?][method=?]", replies_path, "post" do

      assert_select "textarea#reply_content[name=?]", "reply[content]"

      assert_select "input#reply_user_id[name=?]", "reply[user_id]"

      assert_select "input#reply_post_id[name=?]", "reply[post_id]"
    end
  end
end
