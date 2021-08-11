class CategoryController < ApplicationController
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:info] = "Saved Successfully"
      redirect_to create_path
    else
      flash[:danger] = "Creating failed"
      render "create"
    end
  end

  def index
    @category = Category.all
  end

  def edit
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end 
end
