require 'rails_helper'


RSpec.describe MoviesController, type: :controller do

  let(:valid_attributes) {
    { title: 'Title',
      release_year: '1000',
      price: '20.00',
      description: 'Notes one movie',
      imdb_id: '0000',
      poster_url: 'http://example.com'}
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all movies as @movies" do
      movie = Movie.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:movies)).to eq([movie])
    end
  end

  describe "GET #show" do
    it "assigns the requested movie as @movie" do
      movie = Movie.create! valid_attributes
      get :show, {:id => movie.to_param}, valid_session
      expect(assigns(:movie)).to eq(movie)
    end
  end

end
