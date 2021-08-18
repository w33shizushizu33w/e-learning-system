class WordsController < ApplicationController
    def new
        @word = Word.new
      end
    
      def create
        @word = Word.new(word_params)
        if @word.save
          flash[:success] = "Saved Successfully"
          redirect_to words_path
        else
          flash[:danger] = "Creating failed"
          render "create"
        end
        
        choice = correct_word.choices.build(word_id: params[:word_id])
        choice.save
        redirect_to words_path

      end
    
      def index
        @word = Word.all
        @question = Category.joins("JOIN categories ON words.category_id = categories.id")
                            .select("*, words.content")
                            .where("content = 1")
        @word = Word.paginate(page: params[:page], per_page: 5 )
      end
    
      def edit
      end
    
      def show
        
      end
    
      def dashboard
      end
    
      def categories
        @category = Category.paginate(page: params[:page], per_page: 10 )
      end
    
    private
    
    def word_params
      params.require(:word).permit(:category_id, :content, choices_attributes:[:word_id, :content, :correct])
    end
    
    def correct_word
      @word = Word.find(params[:id])
    end
    
end
