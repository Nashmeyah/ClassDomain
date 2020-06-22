class CategoriesController < ApplicationController
before_action :authenticate_user!
before_action :set_category, only: [ :show, :edit, :update, :destroy]

    def index
        @category = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(name: params[:category][:name])
        if @category.valid?
            @category.save
            redirect_to @category
        else 
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @category.update(name: params[:category][:name])
        if @category.valid?
            redirect_to category_path(@category)
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path
    end

    private

    def set_category
        @category = Category.find_by(id: params[:id])
    end

end
