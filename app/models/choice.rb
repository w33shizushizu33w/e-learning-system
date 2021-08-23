class Choice < ApplicationRecord
  belongs_to :word
  validates :content, presence: true, uniqueness: { scope: :word }
end
