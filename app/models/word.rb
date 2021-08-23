class Word < ApplicationRecord
    belongs_to :category
    validates :category_id, presence: true
    validates :content, presence: true
  
    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices, allow_destroy: true
  end
