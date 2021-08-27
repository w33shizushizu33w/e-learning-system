class AnswersController < ApplicationController
  def new
    @answers = Answer.new
    @lesson = Lesson.where(user_id: current_user.id, id: params[:lesson_id])
    @category = Category.select("categories.*").joins("LEFT JOIN lessons ON lessons.category_id = categories.id").where("lessons.id = #{params[:lesson_id]}").limit(1).pluck(:title)
    @word = Word.select("words.*")
                .joins("LEFT JOIN lessons ON words.category_id = lessons.category_id LEFT JOIN answers ON words.id = answers.word_id")
                .where("answers.id = NULL AND lessons.user_id = #{current_user.id} AND lessons.id = #{params[:lesson_id]}")
                .limit(1)
  end

  def index
  end

  def show
    @answer = Answer.find(params[:id])
  end
  
  def create
    @answers = Answer.new(answer_params)         #prepares and recieves the submitted answer
    @lesson = Lesson.find(@answers.lesson_id)
    
    if @answers.save                           #saves the data into DB
      flash[:success] = "Answer Saved!"
      @total_words = Word.where(category_id: @lesson.category_id).count          #retrieves the total words for a category
      @current_answers = Answer.where(lesson_id: @answers.lesson_id).count    #retrieves the total answered words based from the category
      if @current_answers == @total_words        #will check if the value of @current_answers are the same with @total_words
        redirect_to lesson_path(@lesson)         #this will bring us to the lessons results page
      else
      redirect_to new_lesson_answer_path(@lesson.id)
      end
    else
      flash[:warning] = @answers.errors.full_messages.to_sentence
      redirect_to new_lesson_answer_path(@lesson.id)
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:word_id, :lesson_id, :choice_id)
  end
end
