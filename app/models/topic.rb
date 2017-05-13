class Topic < ApplicationRecord
  has_many :quizzes, dependent: :destroy
  belongs_to :discipline
  accepts_nested_attributes_for :quizzes, reject_if: :all_blank, allow_destroy: true

  validates_presence_of :name
end
