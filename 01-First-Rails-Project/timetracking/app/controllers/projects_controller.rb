class ProjectsController < ApplicationController
  def index 
    @projects = Project.last_ten_updated
  end

  def show
    id = params[:id]
    @project = Project.find_by(id: id)
    if @project.nil?
      render :error
    end
  end
end