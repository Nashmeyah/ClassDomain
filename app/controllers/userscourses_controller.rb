class UserscoursesController < ApplicationController
  before_action :authenticate_user!

  def index
      @userscourses = current_user.userscourses
  end

  def create
    @userscourses = current_user.userscourses.build(:user_id => current_user.id, :course_id => params[:id])
    if @userscourses.valid?
      @userscourses.save
      redirect_to  userscourses_path 
    else 
      flash.alert = "Failed to join course."
      redirect_to userscourses_path 
    end
  end

  def show
    @userscourses = Userscourse.find_by(id: params[:id])
  end

  def destroy
    Userscourse.find_by(id: params[:id]).destroy
    redirect_to userscourses_path
  end
  
end
