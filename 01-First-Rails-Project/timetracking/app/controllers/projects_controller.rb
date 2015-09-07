class ProjectsController < ApplicationController
  def index 
    @projects = Project.last_ten_updated
  end

  def blablaba
    
  end
end