class EntriesController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @entry = Entry.new
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)
    if @entry.save
      flash[:notice] = "Entry #{@entry.id} created successfully"
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    entry = Entry.find(params[:id])
    entry.destroy
    redirect_to project_path(entry.project)
  end

  def edit
    @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      flash[:notice] = "Entry #{@entry.id} edited successfully"
      redirect_to project_path(@entry.project)
    else
      render :edit
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :start_date, :comment)
  end

end