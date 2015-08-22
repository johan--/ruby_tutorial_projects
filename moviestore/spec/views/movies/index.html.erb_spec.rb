require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        :title => "Title",
        :release_year => 1,
        :price => 1.5,
        :description => "MyText",
        :imdb_id => "Imdb",
        :poster_url => "Poster Url"
      ),
      Movie.create!(
        :title => "Title",
        :release_year => 1,
        :price => 1.5,
        :description => "MyText",
        :imdb_id => "Imdb",
        :poster_url => "Poster Url"
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Imdb".to_s, :count => 2
    assert_select "tr>td", :text => "Poster Url".to_s, :count => 2
  end
end
