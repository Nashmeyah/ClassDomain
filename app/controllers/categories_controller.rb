class CategoriesController < ApplicationController
before_action :authenticate_user!
before_action :set_category, only: [ :show, :edit, :update, :destroy]

    def index
        if user_signed_in?
            @category = Category.all
        end
    end

    def new
        if user_signed_in?
            @category = Category.new
        end
    end

    def show
        if user_signed_in?
             render :show
        end
        # flash[:error]"You must sign in or create an account to view this page"
    end

    def create
        @category = Category.new(name: params[:name])
    end

    def edit
    end

    def update
        @category.update(name: params[:name])
        redirect_to category_path(@category)
    end

    def delete
        @category.destroy
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

end
