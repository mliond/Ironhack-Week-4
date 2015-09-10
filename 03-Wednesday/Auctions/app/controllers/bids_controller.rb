class BidsController < ApplicationController

  def new 
    @bid = Bid.new
    @product = Product.find(params[:product_id]) 
  end

  def create
    @product = Product.find(params[:product_id]) 
    @bid = @product.bids.new(bid_params)
    if @bid.save 
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
