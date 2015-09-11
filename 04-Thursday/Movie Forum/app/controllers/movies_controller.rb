class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def search_results
    @twenty_results = []
    @search = Imdb::Search.new(params[:keyword]).movies
    @search.each do |result|
      break if @twenty_results.count == 3
      unless result.poster.nil? 
        @twenty_results.push(result)
      end
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    item = params[:item]
    Movie.create({
              title: item.title,
              poster: item.poster,
              year: item.year,
              synopsis: item.plot_summary
              })
      redirect_to movies_path

    # @movie = Movie.new
    # @keyword = movie_params[:title]
    # if Movie.search_db(@keyword).present? 
    #   redirect_to movie_path(Movie.search_db(@keyword))
    # else 
    #   @search = Imdb::Search.new(@keyword).movies.first
    #   @movie = Movie.create({
    #     title: @search.title,
    #     poster: @search.poster,
    #     year: @search.year,
    #     synopsis: @search.plot_summary
    #     })
    #   redirect_to movies_path
    # end
  end

  def show 
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    # params.require(:movie).permit(:title, :poster, :year, :synopsis)
    params.require(:item)
  end
end