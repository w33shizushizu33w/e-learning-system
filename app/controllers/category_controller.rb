class CategoryController < ApplicationController
  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    @category = Category.all
  end

  def edit
  end
end
