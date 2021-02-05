class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #gives access to methods in the views
    helper_method :current_user, :logged_in?, :redirect_if_not_logged_in
    before_action :redirect_if_not_logged_in, except: [:homepage]

    include ApplicationHelper

    def homepage
        if logged_in?
            redirect_to user_path(current_user)
        end
    end


    def logged_in?
      !!current_user
    end
  
  
    def redirect_if_not_logged_in
      redirect_to '/' if !logged_in?
    end
  
  end
