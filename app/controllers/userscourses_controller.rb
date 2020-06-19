class UserscoursesController < ApplicationController

  def index

    @userscourses = current_user.userscourses.all
    
    binding.pry
  end

  def create
    @userscourses = current_user.userscourses.build(:user_id => current_user.id, :course_id => params[:id])
    @userscourses.save
    binding.pry
    redirect_to userscourses_show_path(@userscourses)  
  end

  def show
    # if params[:category_id]
    #   @category = Category.find(params[:category_id])
    #   @userscourses = Userscourse.find_by(id: params[:id])
    # end
    @userscourses = Userscourse.find_by(id: params[:id])
  end

end
