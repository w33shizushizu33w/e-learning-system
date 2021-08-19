class Word < ApplicationRecord
    belongs_to :category
    has_many :choices, dependent: :delete_all
    accepts_nested_attributes_for :choices, allow_destroy: true
    
    def choiced_correct?(word)
        choices.where(word_id: word.id).exists?
    end
end
