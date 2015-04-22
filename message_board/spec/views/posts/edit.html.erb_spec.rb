require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  let(:user) { User.create(email: "example@rails.com",
                           password: "password",
                           password_confirmation: "password") }
  before(:each) do
    @post = assign(:post, Post.create!(
      :title => "MyText",
      :content => "MyText",
      :user => user
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "textarea#post_title[name=?]", "post[title]"

      assert_select "textarea#post_content[name=?]", "post[content]"
    end
  end
end
