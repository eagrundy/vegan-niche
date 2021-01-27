module RestaurantsHelper

    def cuisine_select(f)
        if params[:cuisine_id]
            f.hidden_field :cuisine_id
        else
            render partial: "cuisine_select", locals: {f: f}
        end
    end
end