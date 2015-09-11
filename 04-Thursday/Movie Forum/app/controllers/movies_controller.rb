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
    @keyword = movie_params[:title]
    if Movie.search_db(@keyword).present? 
      redirect_to movie_path(Movie.search_db(@keyword))
    else 
      @search = Imdb::Search.new(@keyword).movies.first
      @movie = Movie.create({
        title: @search.title,
        poster: @search.poster,
        year: @search.year,
        synopsis: @search.plot_summary
        })
      redirect_to movies_path
    end
  end

  def show 
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :poster, :year, :synopsis)
  end

end
