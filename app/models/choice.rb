class Choice < ApplicationRecord
    belongs_to :word, dependent: :destroy
end
