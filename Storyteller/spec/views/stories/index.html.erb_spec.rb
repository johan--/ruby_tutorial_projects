require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(title: 'Title', body: 'Body'),
      Story.create!(title: 'Title', body: 'Body')
    ])
  end

  it "renders a list of stories" do
    render
  end
end
