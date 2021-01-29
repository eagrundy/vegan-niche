class RestaurantsController < ApplicationController
    include RestaurantsHelper

    def index
        if params[:search]
            @restaurants = Restaurant.search_by_name(params[:search])
        else
        @restaurants = Restaurant.all
        end
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end
    
end