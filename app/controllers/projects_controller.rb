class ProjectsController < ApplicationController
  before_action :set_project, only: [:create, :show, :edit, :update, :destroy]

  def index
    @project = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.courses.projects.build(project_params)
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
  end

  private

  def set_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :category_id, :user_id)
  end
end
