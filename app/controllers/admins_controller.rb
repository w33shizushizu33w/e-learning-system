class AdminsController < ApplicationController

  def new
    @admin = Admin.new
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

 
end
