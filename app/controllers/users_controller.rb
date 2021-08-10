class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:session] = "Saved Successfully"
          redirect_to login_url
        else
          flash[:danger] = "Invalid content. Try Again."
          render 'new'
        end
    end

    def index
        @user = User.all
        @users = User.paginate(page: params[:page], per_page: 10 )
    end

    def show
        @user = User.find(params[:id])
    end
    
    def destroy
        User.find(params[:id]).destroy
        redirect_to user_url
    end
     
private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
end
