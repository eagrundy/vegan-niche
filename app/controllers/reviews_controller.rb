class ReviewsController < ApplicationController
    # before_action :current_user, only: [:destroy]
    before_action :set_restaurant, only: [:new, :create, :edit, :update]
    before_action :set_review, only: [:edit, :update, :destroy]


    def new
        if current_user && logged_in?
            @review = Review.new
            
        else
            flash[:alert] = "Please log in to review a restaurant!"
            redirect_to login_path
        end
    end

    def create
        @review = Review.new(review_params)
        @review.restaurant_id = @restaurant.id
        @review.user_id = current_user.id
        if @review.valid?
            @review.save
        else
            flash[:alert] = "Review can't be blank!"
        end
        redirect_to restaurant_path(@restaurant)
    end

    def edit
        # @review = @restaurant.reviews
    end

    def update
        # @review.restaurant_id = @restaurant.id
        # @review.user_id = current_user.id
        if @review.update(review_params)
            
        else
            flash[:alert] = "Something went wrong! Please, try again!"
        end
        redirect_to restaurant_path(@restaurant)
    end

    
    def destroy
        @review.destroy
        flash[:success] = "Review deleted!"
        redirect_to restaurants_path
    end
    
    private
    
    def review_params
        params.require(:review).permit(
            :content,
            :rating,
            :user_id,
            :restaurant_id
            )
        end
        
        def set_restaurant
            @restaurant = Restaurant.find_by_id(params[:restaurant_id])
        end

        def set_review
            @review = Review.find(params[:id])
        end
    end

      # def index
    #     # if params[:restaurant_id]
    #     #     @reviews = @restaurant.reviews
    #     # else 
    #     @reviews = Review.all
    #     # end
    # end

    # def show
    #     @review = Review.find_by_id(params[:id])
    #     # @reviews = @restaurant.reviews.order(id: :desc)
    # end