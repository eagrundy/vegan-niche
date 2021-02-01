class SessionsController < ApplicationController
    # require 'securerandom'

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:alert] = "You are signed in!"
            redirect_to user_path(@user)
        else
            redirect_to login_path
        end
    end
        

    def facebook
        # binding.pry
        @user = User.find_or_create_by(email: auth['info']['email']) do |u|
            u.username = auth['info']['name']
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(9)
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end


    def destroy
        reset_session
        flash[:alert] = "You are now Signed Out!"
        redirect_to root_path
        # session.delete :user_id
        # redirect_to '/'
    end

    
    private
    
    def auth
        request.env['omniauth.auth']
    end

end
    