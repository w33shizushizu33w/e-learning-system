class WordsController < ApplicationController
    def new
        @word = Word.new
        3.times{ @word.choices.build }
      end
    
      def create
        @word = Word.new(word_params)
        if @word.save
          flash[:success] = "Saved Successfully"
          redirect_to words_path
        else
          flash[:danger] = "Creating failed"
          render "new"
        end
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
      params.require(:word).permit(:category_id, :content, choices_attributes:[:id, :word_id, :content, :correct])
    end
    
end
