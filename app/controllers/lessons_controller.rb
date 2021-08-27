class LessonsController < ApplicationController
  before_action :is_admin?

  def index
    @category = Category.find(params[:id]).paginate(page: params[:page], per_page: 6 )
    @lesson = Lesson.new
    @all_lesson = Lesson.all.paginate(page: params[:page], per_page: 6 )    
    @learned = Lesson.joins("JOIN categories ON lessons.category_id = categories.id")
                      .select("categories.*, lessons.result")
                      .where("result = 1")
                      .paginate(page: params[:page], per_page: 6 )
    @not_learned = Category.select("*") #*全て
                           .joins("LEFT JOIN lessons ON lessons.category_id = categories.id")
                           .where("category_id = null")
                           .paginate(page: params[:page], per_page: 6 )                
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    @category = Category.find(@lesson.category_id)
    @words = Word.where("category_id = #{@category.id}")
    @answers = Answer.where("lesson_id = #{@lesson.id}")
    @choices = Choice.all
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:success] = "Lesson start!"
      redirect_to new_lesson_answer_path(@lesson)
    else
      flash[:danger] = @lesson.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def lesson_params
    params.require(:lesson).permit(:user_id, :category_id, :result)
  end
end
