class ProjectsController < ApplicationController
  before_action :set_project, only: [:create, :show, :edit, :update, :destroy]

  def index
    @project = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.build(project_params)
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    @project = current_user.projects.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :course_id => params[:course_id], :user_id => current_user.id)
  end
end
