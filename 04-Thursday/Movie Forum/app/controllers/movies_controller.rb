class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search
    
  end

  def search_results
  end

  def new
    @movie = Movie.new
  end

  def create
    @search = Imdb::Search.new(movie_params[:title]).movies.first
    @movie = Movie.create({
      title: @search.title,
      poster: @search.poster,
      year: @search.year,
      synopsis: @search.plot_synopsis
      })
    redirect_to movies_path
  end

  def show 
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster, :year, :synopsis)
  end

end
