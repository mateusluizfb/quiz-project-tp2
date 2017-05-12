class Topic < ApplicationRecord
  belongs_to :discipline
  has_many :quizzes

  validates_presence_of :name
end
