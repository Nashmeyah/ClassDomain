class UserscoursesController < ApplicationController

  def index
    @userscourses = current_user.userscourses
  end

  def create
    @userscourses = current_user.userscourses.build(:user_id => current_user.id, :course_id => params[:id])
    @userscourses.save
    redirect_to  userscourses_index_path 
  end

  def show
    @userscourses = Userscourse.find_by(id: params[:id])
  end

  def destroy
    binding.pry
    Userscourse.find_by(id: params[:id]).destroy
    redirect_to  userscourses_index_path
  end
end
