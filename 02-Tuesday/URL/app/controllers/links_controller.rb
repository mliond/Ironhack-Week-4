class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def show
  end

  def new
    @link = Link.new
  end

  def create
    long_url = params[:link][:long_url]
    Link.create_new_entry_sec(long_url)
    redirect_to('/links')
  end

  def forward
    short_url = params[:short_url]
    long_url = Link.look_up_url(short_url)
    redirect_to(long_url)
  end

  private

  def project_params
    params.require(:link).permit(:long_url)
  end

end
