class CoursesController < ApplicationController
before_action :authenticate_user!
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]

  def index
      @category = Category.find_by(id: params[:category_id])
      @course = Course.all
      # binding.pry
  end

  def new
    # && !Category.exists?(params[:category_id])
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      @course = @category.courses.build
    else
      redirect_to categories_path
    end
  end

  def create
      @category = Category.find_by(id: params[:category_id])
      @course = Course.new(course_params)
      # binding.pry
      if @course.valid?
        @course.save
        redirect_to category_course_path(@category, @course)
      else 
        render :new
      end
  end

  def show
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
      if @category.nil?
        redirect_to categories_path
      else
        @course = @category.courses.find_by(id: params[:id])
        if @course.nil?
          redirect_to categories_path
        end
      end 
    else
      @course = Course.find(params[:id])
    end
  end

  def edit
    if params[:category_id]
      @category = Category.find_by(id: params[:category_id])
        if @category.nil?
          redirect_to categories_path
        else
          @course = @category.courses.find_by(id: params[:id])
          if @course.nil?
            redirect_to category_courses_path(@category)
          end 
        end
    else
      @course = Course.find(params[:id])
    end 
  end

  def update
    @category = Category.find_by(id: params[:category_id])
    @course = @category.courses.find_by(id: params[:id])
    @course.update(course_params)
    if @course.save
      redirect_to category_course_path
    else  
      render :edit
    end
  end

  def destroy
    @category = Category.find_by(id: params[:category_id])
    Course.find(params[:id]).destroy
    redirect_to category_courses_path
  end

  private

  def set_course
    @course = Course.find_by(id: params[:id])
    
  end

  def course_params
    params.require(:course).permit(:name, :description, :category_id)
  end

end
