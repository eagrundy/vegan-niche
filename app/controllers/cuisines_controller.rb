class CuisinesController < ApplicationController
    
    def index
        @cuisines = Cuisine.all
        # @restaurants = @cuisine.restaurants
    end

    def show
        # @restaurants = @cuisine.restaurants
        @cuisine = Cuisine.find_by(id: params[:id])
        # @restaurant = Restaurant.find(params[:restaurant_id])
    end

end