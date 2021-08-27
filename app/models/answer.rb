class Answer < ApplicationRecord
    has_one :word
    has_one :choice
    belongs_to :lesson
end
