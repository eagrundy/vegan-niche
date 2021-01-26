class SessionsController < ApplicationController
    # require 'securerandom'

    def home
    end

    def new
        @user = User.new
    end

    def create
        # byebug
        @user = User.find_by(email: params[:email])
        # return head(:forbidden) unless user.authenticate(user_params[:password]) 
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        elsif @user == nil
            flash[:alert] = "User not found."
            redirect_to login_path(@user)
        else
            flash[:alert] = "Email and/or Password incorrect"
            redirect_to login_path(@user)
        end
    end
    # user = User.find_by(:email => params[:user][:email])
        # returns (forbidden) unless user.authenticate(user_params[:password])
        # if user && user.authenticate(params[:user][:password])
        #     session[:user_id] = user.id
        #     redirect_to user_path(user)
        # else
        #     flash[:message] = "Incorrect email and/or password. Please try again."
        #     redirect_to login_path
        # end
        

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
    