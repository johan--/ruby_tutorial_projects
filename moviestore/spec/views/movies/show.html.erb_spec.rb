require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "Title",
      :release_year => 1,
      :price => 1.5,
      :description => "MyText",
      :imdb_id => "Imdb",
      :poster_url => "Poster Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Imdb/)
    expect(rendered).to match(/Poster Url/)
  end
end
