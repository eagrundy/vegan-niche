class ReviewsController < ApplicationController
    def create
        @review = Review.new(review_params)
        @review.user_id = current_user.id

        if @review.valid?
            @review.save
        else
            flash[:notice] = "Review cannot be blank!"
        end 
        redirect_to restaurant_path(@review.restaurant)
    end

    private

    def review_params
        params.require(:review).permit(
            :content,
            :rating
            :user_id
            :restaurant_id
        )
    end
end