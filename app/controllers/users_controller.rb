class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]
    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    

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
            @user_restaurants = Restaurant.where(user_id: @user.id)
        else
            redirect_to '/login'
        end
    end

    def edit
        if @user != current_user
          flash[:message] = "Not your profile, so you can't edit it."
          redirect_to user_path
        end
    end

    def update
        if @user.update(user_params)
          redirect_to @user
        else
          render :edit 
        end
    end

    def destroy
        if logged_in?
            User.find_by_id(current_user.id).destroy
            session.clear
            flash[:notice] = "Your account has been deleted!"
            redirect_to root_path
        else
            flash[:message] = "Not authorized to delete"
            redirect_to user_path
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def find_user
        @user = User.find(params[:id])
    end
end