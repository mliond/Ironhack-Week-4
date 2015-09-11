class BooksController < ApplicationController

  def index
    @books = Book.all.limit(10)
  end
  
  def ordered
    @books = Book.all.order(created_at: :desc).limit(10)
    render :index
  end

  def searched
    @books = Book.search(params[:search])
    render :index
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
    @average_stars = calculate_average_stars(@book.reviews)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.create(book_params)
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :price)
  end

  def calculate_average_stars(array)
    sum = 0
    array.each do |item|
      sum += item.stars 
    end
    average = sum / array.count
  end

end
