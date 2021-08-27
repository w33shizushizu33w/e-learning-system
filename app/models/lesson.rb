class Lesson < ApplicationRecord
  has_many :categories
  has_many :answers
  has_many :users
end
