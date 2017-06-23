##
# Esta é uma classe intermediária entre usuário e questionário
class UserQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :user
end
