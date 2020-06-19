class CoursesController < ApplicationController
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]

  def index
      @course = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    
    @course = Course.new(course_params)
    
    if current_user.courses.none? { |crs| crs == @course }
      return "You are already in this class"
    elsif
      @course = current_user.courses.build(course_params)
      
      redirect_to course_path(@course)
    else
      @course = Course.create(name: params[:name], description: params[:description], category_id: params[:category_id])
      redirect_to course_path(@course)
    end
  end

  def show
    # if params[:category_id] --- needs validation
    
      @category = Category.find(params[:category_id])
      @course = Course.find(params[:id])
    # end    

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
    params.require(:course).permit(:name, :description, :category_id, category_attributes: [])
  end

end
