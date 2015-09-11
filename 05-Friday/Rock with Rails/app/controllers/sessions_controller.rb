class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user.password == params[:session][:password]
      session[:user_id] = user.id
      redirect_to concerts_path
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/sessions/new'
  end

end
