class ConcertsController < ApplicationController

  def index
    @concerts = Concert.all
  end

  def concerts_today
    @concerts = Concert.where("date < ?", Date.today+1)
    render :index
  end

  def concerts_month
    @concerts = Concert.where("date > ?", Date.today+1)
    render :index
  end

  def concerts_budget(budget)
    @concerts = Concert.where("price < ?", budget)
    render :index
  end

  def show
    @concert = Concert.find(params[:id])
  end

end
