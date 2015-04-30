require 'rails_helper'

RSpec.describe "pictures/show", type: :view do
  before(:each) do
    @picture = assign(:picture, Picture.create!(
      :user => nil,
      :album => nil,
      :caption => "Caption",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Caption/)
    expect(rendered).to match(/MyText/)
  end
end
