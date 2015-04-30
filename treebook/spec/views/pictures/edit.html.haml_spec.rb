require 'rails_helper'

RSpec.describe "pictures/edit", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :user => nil,
      :album => nil,
      :caption => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit picture form" do
    render

    assert_select "form[action=?][method=?]", picture_path(@picture), "post" do

      assert_select "input#picture_user_id[name=?]", "picture[user_id]"

      assert_select "input#picture_album_id[name=?]", "picture[album_id]"

      assert_select "input#picture_caption[name=?]", "picture[caption]"

      assert_select "textarea#picture_description[name=?]", "picture[description]"
    end
  end
end
