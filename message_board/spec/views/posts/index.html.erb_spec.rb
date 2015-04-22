require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { User.create(email: "example@rails.com",
                           password: "password",
                           password_confirmation: "password") }
  before(:each) do
    assign(:posts, [
      Post.create!(
        :title => "MyText",
        :content => "MyContent",
        :user => user
      ),
      Post.create!(
        :title => "MyText",
        :content => "MyContent",
        :user => user
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => user.email.to_s, :count => 2
  end
end
