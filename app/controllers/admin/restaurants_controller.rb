class Admin::RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:edit, :update, :destroy]
    before_action :check_if_admin
    before_action :set_cuisine, only: [:index, :new, :create]
    include RestaurantsHelper

    def index
        if params[:cuisine_id]
            # @cuisine = Cuisine.find_by_id(params[:cuisine_id])
            @restaurants = @cuisine.restaurants
        else
            @restaurants = Restaurant.all
        end
    end

    def show
        @restaurant = Restaurant.find_by_id(params[:id])
    end

    def new
        if params[:cuisine_id]
            @cuisine = Cuisine.find_by_id(params[:cuisine_id])
            @restaurant = @cuisine.restaurants.build
        else
            @restaurant = Restaurant.new
            @restaurant.build_cuisine
        end
    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to admin_restaurant_path(@restaurant)
        else
            render :new
        end
    end
    
    def edit
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to admin_restaurant_path
        else 
            render 'edit'
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to admin_restaurants_path
    end

    private

    def check_if_admin
        redirect_to root_path unless current_user.admin?
    end

    # Only allow a list of trusted parameters through
    def restaurant_params
        params.require(:restaurant).permit(:name, :options, :source, :image_url, :cuisine_id)
    end

    def set_cuisine
        @cuisine = Cuisine.find_by_id(params[:cuisine_id])
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end
end