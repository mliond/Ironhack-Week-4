class ProjectsController < ApplicationController
  def index 
    @projects = Project.last_ten_updated
  end
end
