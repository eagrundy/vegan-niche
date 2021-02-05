class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    
    validates :content, length: { maximum: 250 }, presence: true

    def generate_stars 
        if self.rating == 1 
            "⭐️"
        elsif self.rating == 2
            "⭐️⭐️"
        elsif self.rating == 3
            "⭐️⭐️⭐️"
        elsif self.rating == 4
            "⭐️⭐️⭐️⭐️"
        else
            "⭐️⭐️⭐️⭐️⭐️"
        end
    end

    # def review_average
    #     # binding.pry
    #     @review_average = Review.where(:restaurant_id => params[:id]).average(:rating).to_i
    # end


end