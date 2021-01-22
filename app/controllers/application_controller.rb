class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :current_user
    helper_method :current_user, :logged_in?

    def homepage
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
    end

    def login(user)
        session[:user_id] = user.id
    end

    def logout
        session[:user_id] = nil
        redirect_to '/', notice: 'You are logged out!'
    end

end
