class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:success] = "Saved Successfully"
      redirect_to admins_path
    else
      flash[:danger] = "Creating failed"
      render "create"
    end
  end

  def index
    @admin = Admin.all
    @admin = Admin.paginate(page: params[:page], per_page: 5 )
  end

  def edit
  end

  def show
    
  end

  def dashboard
  end

  def categories
    @category = Category.paginate(page: params[:page], per_page: 10 )
  end

private

def admin_params
  params.require(:admin).permit(:word, :answer)
end

 
end
