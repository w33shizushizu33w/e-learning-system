class LessonsController < ApplicationController
  before_action :is_admin?
  def index
    @category = Category.paginate(page: params[:page], per_page: 6 )
    @learned = Lesson.joins("JOIN categories ON lessons.category_id = categories.id")
                      .select("categories.*, lessons.result")
                      .where("result = 1")
                      .paginate(page: params[:page], per_page: 6 )
    @not_learned = Category.joins("JOIN lessons ON lessons.category_id = categories.id")
                         .select("*") #*全て
                         .where("lessons.category_id = null")
                         .paginate(page: params[:page], per_page: 6 )
    
    

  end

end
