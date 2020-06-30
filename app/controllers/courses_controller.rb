class CoursesController < ApplicationController
before_action :authenticate_user!
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]
before_action :set_category, only: [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
      @course = Course.all
      # @search = Course.where(["name LIKE ?", "%#{params[:search]}%"])
  end

  def new
    if params[:category_id]
     set_category
      @course = @category.courses.build
    else
      redirect_to categories_path
    end
  end

  def create
      @course = Course.new(course_params)
      if @course.valid?
        @course.save
        redirect_to category_course_path(@category, @course)
      else 
        render :new
      end
  end

  def show
    if params[:category_id]
      set_category
      if @category.nil?
        redirect_to categories_path
      else
        @course = @category.courses.find_by(id: params[:id])
        if @course.nil?
          redirect_to categories_path
        end
      end 
    else
      # @course = Course.find(params[:id])
      # set_course
    end
  end

  def edit
    if params[:category_id]
      set_category
        if @category.nil?
          redirect_to categories_path
        else
          @course = @category.courses.find_by(id: params[:id])
          if @course.nil?
            redirect_to category_courses_path(@category)
          end 
        end
    else
      # set_course
    end 
  end

  def update
    @course = @category.courses.find_by(id: params[:id])
    @course.update(course_params)
    if @course.save
      redirect_to category_course_path
    else  
      render :edit
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    redirect_to category_courses_path
  end

  private

  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  def set_course
    @course = Course.find_by(id: params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :description, :category_id)
  end

end
