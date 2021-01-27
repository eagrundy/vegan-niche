class Admin::CuisinesController < ApplicationController
    def index
        @cuisines = Cuisine.all
    end

    def new
        @cuisine = Cuisine.new
    end

    def create
        # binding.pry
        @cuisine = Cuisine.new(cuisine_params)
        if @cuisine.save
            redirect_to cuisine_path(@cuisine)
        else
            render :new
        end
    end

    def show
        @cuisine = Cuisine.find_by(id: params[:id])
    end

    private

    def cuisine_params
        params.require(:cuisine).permit(:name, restaurants_attributes: [:name, :address, :options, :source, :image_url])
    end
end
end