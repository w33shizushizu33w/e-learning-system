class Word < ApplicationRecord
    belongs_to :category
    has_many :choices, dependent: :destroy
    
    def choiced_correct?(word)
        choices.where(word_id: word.id).exists?
    end
end
