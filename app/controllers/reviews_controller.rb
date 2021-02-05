class ReviewsController < ApplicationController
    before_action :set_restaurant, only: [:index, :new, :create, :edit, :update]
    before_action :set_review, only: [:edit, :update, :destroy]
    
    def index
       
        @reviews = @restaurant.reviews.order(id: :desc)
        # @review_average = Review.where(:restaurant_id => params[:restaurant_id]).average(:rating).to_i
        @review_average = @restaurant.reviews.average(:rating)
    end
    
    def new
        if current_user && logged_in?
            @review = Review.new
            # @review = @restaurant.reviews.build
            # test this out
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
            # try to use just .save
            # current_user.review.build
        else
            flash[:alert] = "Review can't be blank!"
        end
        redirect_to restaurant_reviews_path(@restaurant)
    end

    def edit
    end

    def update
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


    # def show
    #     @review = Review.find_by_id(params[:id])
    #     # @reviews = @restaurant.reviews.order(id: :desc)
    # end