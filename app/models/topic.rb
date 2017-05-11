class Topic < ApplicationRecord
  belongs_to :discipline
  has_many :quizzes
end
