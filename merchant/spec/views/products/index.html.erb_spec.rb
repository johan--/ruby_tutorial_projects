require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :title => "Title",
        :price => "9.99",
        :description => "MyText",
        :image_url => "Image Url"
      ),
      Product.create!(
        :title => "Title",
        :price => "9.99",
        :description => "MyText",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of products" do
    render

    expect(rendered).to match /Title/
    expect(rendered).to match /MyText/
    expect(rendered).to match /products\/Image Url/
    expect(rendered).to match /\$9.99/
  end
end
