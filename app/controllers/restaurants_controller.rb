class RestaurantsController < ApplicationController
    include RestaurantsHelper
    before_action :set_cuisine, only: [:index]

    def index
        if params[:search]
            @restaurants = Restaurant.search_by_name(params[:search])
        elsif
            params[:cuisine_id]
            @restaurants = @cuisine.restaurants
        else
            @restaurants = Restaurant.all
        end
    end

    def show
        @restaurant = Restaurant.find_by_id(params[:id])
        @reviews = @restaurant.reviews.order(id: :desc)
        @review_average = Review.where(:restaurant_id => params[:id]).average(:rating).to_i
    end

    private

    def set_cuisine
        @cuisine = Cuisine.find_by_id(params[:cuisine_id])
    end
    
end







# Write a partial for review at another time

# Review_average move it to the review model