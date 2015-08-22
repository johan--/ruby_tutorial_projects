require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :title => "MyString",
      :release_year => 1,
      :price => 1.5,
      :description => "MyText",
      :imdb_id => "MyString",
      :poster_url => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "input#movie_release_year[name=?]", "movie[release_year]"

      assert_select "input#movie_price[name=?]", "movie[price]"

      assert_select "textarea#movie_description[name=?]", "movie[description]"

      assert_select "input#movie_imdb_id[name=?]", "movie[imdb_id]"

      assert_select "input#movie_poster_url[name=?]", "movie[poster_url]"
    end
  end
end
