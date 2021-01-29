class Admin::RestaurantsController < ApplicationController
    # before_action :set_restaurant, only: [:index, :show, :edit, :update, :destroy]
    before_action :check_if_admin
    include RestaurantsHelper

    def index
        if params[:cuisine_id]
            @cuisine = Cuisine.find_by_id(params[:cuisine_id])
            @restaurants = @cuisine.restaurants
        end
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
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
        @restaurant = Restaurant.find(params[:id])
    end

    def update
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update(restaurant_params)
            redirect_to admin_restaurant_path
        else 
            render 'edit'
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to admin_restaurants_path
    end

    private

    def check_if_admin
        redirect_to root_path unless current_user.admin?
    end

    # # Use callbacks to share common setup or constraints between actions
    # def set_restaurant
    #     @restaurant = Restaurant.find(params[:id])
    # end

    # Only allow a list of trusted parameters through
    def restaurant_params
        params.require(:restaurant).permit(:name, :options, :source, :image_url, :cuisine_id)
    end
end