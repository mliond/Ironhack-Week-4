class BidsController < ApplicationController

  def new 
    @bid = Bid.new
    @product = Product.find(params[:product_id]) 
  end

  def create
    @amount = bid_params[:amount]
    user_email = bid_params[:user_id]
    @user = User.find_by(email: user_email)

    @product = Product.find(params[:product_id]) 
    @bid = @product.bids.new(amount: @amount, user_id: @user, product_id: @product.id)

    if @bid.save 
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id, :product_id)
  end

end
