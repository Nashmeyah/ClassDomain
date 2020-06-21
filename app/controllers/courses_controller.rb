class CoursesController < ApplicationController
before_action :authenticate_user!
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]

  def index
      @course = Course.all
  end

  def new
    # && !Category.exists?(params[:category_id])
    if params[:category_id]
      category = Category.find_by(id: params[:category_id])
      @course = category.courses.build
    else
      redirect_to categories_path
    end
  end

  def create
    binding.pry
      @course = Course.new(course_params)
      if @course.valid?
        @course.save
        redirect_to category_course_path(@course)
      else 
        render :new
      end
  end

  def show
    binding.pry
    if params[:category_id]
      @course = Course.find(params[:id])
    else
      @course = Course.find(params[:id])
    end
  end

  def edit
    if params[:category_id]
      category = Category.find_by(id: params[:category_id])
        if category.nil?
          redirect_to categories_path, alert: "Category not found."
        else
          @course = category.courses.find_by(id: params[:id])
          redirect_to category_courses_path(category), alert: "Course not available." if @course.nil?
        end
    else
      @course = Course.find(params[:id])
    end 
  end

  def update
    @course.update(course_params)
    redirect_to category_course_path(@course)
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
