class RestaurantsController < ApplicationController
    include RestaurantsHelper
    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end
    
end