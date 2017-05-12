class Quiz < ApplicationRecord
  belongs_to :topic
  has_many :questions, inverse_of: :quiz
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
end
