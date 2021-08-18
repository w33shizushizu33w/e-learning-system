class LessonsController < ApplicationController

  def index
    @category = Category.paginate(page: params[:page], per_page: 6 )
    @learned = Lesson.joins(:categories)
                      .select("categories.*, lessons.result")
                      .where("result = 1")
                      .paginate(page: params[:page], per_page: 6 )
    @not_learned = Lesson.joins(:words)
                         .select("*") #*全て
                         .where("result = null")
                         .paginate(page: params[:page], per_page: 6 )
  end

end
