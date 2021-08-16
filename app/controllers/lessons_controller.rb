class LessonsController < ApplicationController
  def index
    @category = Category.paginate(page: params[:page], per_page: 6 )
  end
end
