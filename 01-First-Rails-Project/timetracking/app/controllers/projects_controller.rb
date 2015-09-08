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

  def new
    @project = Project.new
    render :new
  end

  def create
    title = params[:project][:title]
    description = params[:project][:description]
    @project = Project.new(title: title, description: description)
    if @project.save == true
      redirect_to "/projects/#{@project.id}"
    else
      render :new
    end

  end

end