class ConcertsController < ApplicationController

  def index
    @heading = "All concerts"
    @concerts = Concert.all
  end

  def concerts_today
    @heading = "Concerts today"
    @concerts = Concert.where("date < ?", Date.today+1)
    render :index
  end

  def concerts_month
    @heading = "Concerts this month"
    @concerts = Concert.where("date > ?", Date.today+1)
    render :index
  end

  def concerts_budget
    @heading = "Concerts under 10€"
    @concerts = Concert.where("price < ?", 10)
    render :index
  end

  def show
    @concert = Concert.find(params[:id])
  end

end
