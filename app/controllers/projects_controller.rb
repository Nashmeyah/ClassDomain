class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :show, :edit, :update, :destroy]
  before_action :set_userscourse, only: [ :new, :create]

  def index
    @project = current_user.projects.by_date
  end

  def new
    if params[:userscourse_id]
      @project = @userscourse.projects.build
      if @userscourse.nil?
        redirect_to userscourses_path
      else
        @project = @userscourse.projects.build
      end      
    end
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.valid?
      @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @project.update(project_params)
    if @project
      redirect_to project_path(@project)
    else 
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_userscourse
    @userscourse = current_user.userscourses.find_by(id: params[:userscourse_id])
  end

  def set_project
    @project = current_user.projects.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :user_id, :userscourse_id)
  end
end
