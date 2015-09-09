class ProjectsController < ApplicationController
  def index
    @projects = Project.last_ten_updated
  end

  def show
    id = params[:id]
    @project = Project.find_by(id: id)
    if @project.nil?
      render :error
    else
      @entries = @project.entries
      render :show
    end
  end

  def new
    @project = Project.new
    render :new
  end

  def create
    # Traditional way:
    # title = params[:project][:title]
    # description = params[:project][:description]
    # @project = Project.new(title: title, description: description)

    # new way with private method below: 
    @project = Project.new(project_params)

    if @project.save == true
      redirect_to "/projects/#{@project.id}"
    else
      render :new
    end
  end

  # This is the private method for the create function above
  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end