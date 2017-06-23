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

<<<<<<< HEAD
  def self.evaluate(questions, user, quiz_id)
    @answers = {}
    @questions_number = questions.count
    @total_value = 0
    @user_score = 0

    questions.each do |question_id, answer_id|
      question = Question.find(question_id)
      marked_answer = Answer.find(answer_id)
      correct_answer = question.answers.where(correct_option: true).first

      question.score == nil ? question_score = 1 : question_score = question.score

      @total_value += question_score
      @answers[question.statement] = { marked: marked_answer.text, correct: correct_answer.text, value: question_score }

    end

    @answers.each do |question, answers|
      if answers[:marked] == answers[:correct]
        @user_score += answers[:value]
      end
    end

    ## Transformar pra base 10 ##
    @nota = ((@user_score * 100) / @total_value) / 10
    @user_quiz = UserQuiz.create(user_id: user.id, quiz_id: quiz_id, score: @nota)
    @user_quiz.save

    return {answers: @answers, nota: @nota}

  end

=======
  ##
  # Nome obrigatório
  validates :name, presence: true
>>>>>>> 9ca7dec589590f70263717b4681f10b93f5869c2
end
