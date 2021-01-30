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
            @user_restaurants = Restaurant.where(user_id: @user.id)
        else
            redirect_to '/'
        end
    end

    def edit
        @user = User.find(params[:id])
        if @user != current_user
          flash[:message] = "Not your profile, so you can't edit it."
          redirect_to user_path
        end
    end

    def update
        @user = User.find(params[:id])
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
end