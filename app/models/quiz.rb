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
  def self.evaluate(questions, user, quiz_id) # rubocop:disable Metrics/AbcSize
    @answers = {}
    @questions_number = questions.count
    @total_value = 0
    @user_score = 0

    questions.each do |question_id, answer_id|
      question = Question.find(question_id)
      marked_answer = Answer.find(answer_id)
      correct_answer = question.answers.where(correct_option: true).first

<<<<<<< HEAD
      question_score = question.score.nil? ? 1 : question.score
=======
      question.score.nil? ? question_score = 1 : question_score = question.score
>>>>>>> 2386f969fa2626121231aeb05c149abfd35beba8

      @total_value += question_score
      @answers[question.statement] = {marked: marked_answer.text, correct: correct_answer.text, value: question_score}
    end

<<<<<<< HEAD
    @answers.each do |_, answers|
=======
    @answers.each do |_question, answers|
>>>>>>> 2386f969fa2626121231aeb05c149abfd35beba8
      @user_score += answers[:value] if answers[:marked] == answers[:correct]
    end

    ## Transformar pra base 10 ##
    @nota = ((@user_score * 100) / @total_value) / 10
    @user_quiz = UserQuiz.create(user_id: user.id, quiz_id: quiz_id, score: @nota)
    @user_quiz.save

    {answers: @answers, nota: @nota}
  end
end
