class Category < ApplicationRecord
    validates :title, :description, presence: true
    has_many :words, dependent: :delete_all
    accepts_nested_attributes_for :words, allow_destroy: true
end
