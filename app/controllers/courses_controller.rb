class CoursesController < ApplicationController
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]

  def index
    @course = Course.all
    
  end

  def new
    
    @course = Course.new
  end

  def create
      @course = current_user.courses.build(course_params)
      binding.pry
      redirect_to course_path(@course)
  end

  def show
  end

  def edit
  end

  def update
    @course.update(course_params)
    redirect_to course_path(@course)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find_by(id: params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :category_id)
  end

end
