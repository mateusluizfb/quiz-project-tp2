##
# Esta classe representa a entidade questionário, que pertence à um tópico
# de uma disciplina e possui muitas questões
class Quiz < ApplicationRecord
  ##
  # Este método estabelece o relacionamento 1-N com tópico
  belongs_to :topic

  ##
  # Este método estabelece o relacionamento 1-N com
  # questões e com exclusão em cascata
  has_many :questions, dependent: :destroy, inverse_of: :quiz

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true

  ##
  # Nome obrigatório
  validates :name, presence: true

  ##
  # Este método calcula a nota do usuário para um determinado questionário
  def evaluate(answer_hash, user)
    user_grade = 0.0
    answers = {}

    answer_hash.each do |question_id, answer_id|
      question = Question.find(question_id)
      correct_answer = question.answers.where(correct_option: true).first
      marked_answer = Answer.find(answer_id)

      user_grade += question.score if correct_answer == marked_answer

      answers[question.statement] = {marked: marked_answer.text, correct: correct_answer.text}
    end

    UserQuiz.create(user: user, quiz: self, score: user_grade)

    {answers: answers, grade: user_grade}
  end
end
