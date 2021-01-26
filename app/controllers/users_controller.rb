class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #log them in
            session[:user_id] = @user.id
            #redirect to show page
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if logged_in?
            @user = User.find(params[:id])
        else
            redirect_to '/'
        end
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end