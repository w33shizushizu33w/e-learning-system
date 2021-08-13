class LessonsController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page], per_page: 10 )
  end
end
