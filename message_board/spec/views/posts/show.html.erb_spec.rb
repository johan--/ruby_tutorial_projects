require 'rails_helper'

RSpec.describe "posts/show", type: :view do
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

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
