class CoursesController < ApplicationController
before_action :set_course, only: [:create, :show, :edit, :update, :destroy]

  def index
      @course = Course.all
  end

  def new
    @course = Course.new(category_id: params[:category_id])
  end

  def create  
    if current_user.courses.none? { |crs| crs == @course }
      binding.pry
      @course = current_user.courses.build(name: params[:course][:name], description: params[:course][:description], category_id: params[:course][:category_id])
      @course.save
      binding.pry
      redirect_to course_path(@course)  
    elsif
      binding.pry
      # binding.pry 
    else
      binding.pry
      @course = Course.create(name: params[:name], description: params[:description], category_id: params[:category_id])
      redirect_to @course
    end
  end

  def show
    # need validation
     if params[:category_id]
    
      @category = Category.find(params[:category_id])
      @course = Course.find(params[:id])
    end 

    @course = Course.find(params[:id])
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
