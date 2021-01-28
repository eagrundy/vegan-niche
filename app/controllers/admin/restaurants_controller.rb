class Admin::RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
    before_action :check_if_admin
    include RestaurantsHelper

    def index
        @restaurants = Restaurant.all
    end

    def show
        @restaurant = Restaurant.find(params[:id])
    end

    def new
        @restaurant = Restaurant.new
    end
    
    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to @restaurant
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
            redirect_to restaurant_path(@restaurant)
        else 
            render 'edit'
        end
    end

    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurant_path
    end

    private

    def check_if_admin
        redirect_to root_path unless current_user.admin?
    end

    # Use callbacks to share common setup or constraints between actions
    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through
    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :options, :source, :image_url, :cuisine_id)
    end
end