class CuisinesController < ApplicationController
    def index
        @cuisines = Cuisine.all
    end

    def show
        @cuisine = Cuisine.find_by(id: params[:id])
    end

end