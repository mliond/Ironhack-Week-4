class BidsController < ApplicationController

  def new 
    @bid = Bid.new
    @product = Product.find(params[:product_id]) 
  end

  def create
    @product = Product.find(params[:product_id]) 
    @highest_bid = @product.bids.sort_by { |k| k["amount"] }.last.amount
    @bid = @product.bids.new(bid_params)
    if @bid.amount > @highest_bid && @bid.amount > @product.min_price && @bid.save 
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id)
  end

end
