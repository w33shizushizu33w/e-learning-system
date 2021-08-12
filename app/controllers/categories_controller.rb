class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Saved Successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Creating failed"
      render "create"
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @category = Category.paginate(page: params[:page], per_page: 10 )
  end

  def edit
    @category = Category.find(params[:id])
    if @category.save
      flash[:success] = "Saved Successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Editing failed"
      render "create"
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end 
end
