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
        @users = User.paginate(page: params[:page], per_page: 9 )
    end

    def show
        @user = User.find(params[:id])
    end
    
    def destroy
        User.find(params[:id]).destroy
        redirect_to users_path
    end
     
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
           flash[:session] = "Saved Successfully"
           redirect_to @user
        else
           flash[:danger] = "Invalid content. Try Again."
           render 'edit'
        end
    end
    
private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
    end

    def current_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
end
