class CategoriesController < ApplicationController

    def index
        
        @category = Category.all
    end

    def new
        
        @category = Category.new
    end

    def show
         
    end

    def create
    end

    def edit
    end

    def update
    end

    def delete
    end


end
