class ProjectsController < ApplicationController
  def index
    @projects = Project.last_ten_updated
  end

  def create
    # Traditional way:
    # title = params[:project][:title]
    # description = params[:project][:description]
    # @project = Project.new(title: title, description: description)

    # new way with private method below: 
    @project = Project.new(project_params)

    if @project.save == true
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    redirect_to projects_path
  end

  def edit
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    render :new
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

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  # This is the private method for the create function above
  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end