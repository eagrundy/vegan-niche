module RestaurantsHelper

    def cuisine_select(f)
        if params[:cuisine_id]
            f.hidden_field :cuisine_id
        else
            render partial: "cuisine_select", locals: {f: f}
        end
    end

    def restaurant_name(restaurant)
        "#{restaurant.name}"
    end

    def cuisine_name(cuisine)
        "#{cuisine.name}"
    end

    def display_reviews
        if @reviews.empty?
            content_tag :div, "This restaurant does not have any reviews", class: 'alert alert-dark text-center'
        else
            render partial: 'restaurants/display_reviews', locals: { reviews: @reviews }
        end
    end
end