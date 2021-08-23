class WordsController < ApplicationController
  def new
    @word = Word.new
    3.times{ @word.choices.build }
  end

  def create
    @word = Word.new(word_params)
    if @word.save
      flash[:success] = "Saved Successfully"
      redirect_to category_words_path(@word.category_id)
    else
      flash[:danger] = "Creating failed"
      redirect_back(fallback_location: root_path)
    end
  end

  def index
    @category = Category.find(params[:category_id])
    @word = Word.where("category_id = @category.id")
    @question = Category.joins("JOIN categories ON words.category_id = categories.id")
                        .select("*, words.content")
                        .where("content = 1")
    @word = Word.paginate(page: params[:page], per_page: 5 )
  end

  def edit
    @word = Word.find(params[:id])
  end

  def update
    @word = Word.find_by(params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = "Saved Successfully"
      redirect_to category_words_path(@word.category_id)
    else
      flash[:danger] = "Editing failed"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @word = Word.find(params[:id]).destroy
    if @word
      flash[:danger] = "Deleted!"
    else
      flash[:warning] = "Delete Failed"
    end
    redirect_back(fallback_location: root_path)
  end

  def categories
    @category = Category.paginate(page: params[:page], per_page: 10)
  end

  private
  def word_params
    params.require(:word).permit(:category_id, :content, choices_attributes: [ :id, :word_id, :content, :correct ])
  end
end