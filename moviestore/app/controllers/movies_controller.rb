class MoviesController < ApplicationController
  before_action :set_movie, only: [:show]

  def index
    @search = Movie.search(params[:q])
    @movies = @search.result
  end

  def show
  end

  private
  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_year, :price, :description, :imdb_id, :poster_url)
  end
end
