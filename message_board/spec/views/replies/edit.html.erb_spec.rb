require 'rails_helper'

RSpec.describe "replies/edit", type: :view do
  before(:each) do
    @reply = assign(:reply, Reply.create!(
      :content => "MyText",
      :user => nil,
      :post => nil
    ))
  end

  it "renders the edit reply form" do
    render

    assert_select "form[action=?][method=?]", reply_path(@reply), "post" do

      assert_select "textarea#reply_content[name=?]", "reply[content]"

      assert_select "input#reply_user_id[name=?]", "reply[user_id]"

      assert_select "input#reply_post_id[name=?]", "reply[post_id]"
    end
  end
end
