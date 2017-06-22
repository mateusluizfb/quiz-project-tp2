class QuizzesController < ApplicationController
  before_action :set_discipline, except: [:evaluate]
  before_action :set_topic, except: [:evaluate]
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = @topic.quizzes
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
  end

  # GET /quizzes/1/edit
  def edit
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = @topic.quizzes.build(quiz_params)
    respond_to do |format|
      if @quiz.save
        format.html { redirect_to discipline_topic_quiz_path(@discipline, @topic, @quiz), notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to discipline_topic_quiz_path(@discipline, @topic, @quiz), notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to discipline_topic_quizzes_path(@discipline, @topic), notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def evaluate
    @answers = {}
    @questions_number = params[:questions].count
    @total_value = 0
    @user_score = 0

    params[:questions].each do |question_id, answer_id|
      question = Question.find(question_id)
      marked_answer = Answer.find(answer_id)
      correct_answer = question.answers.where(correct_option: true).first
      question_score = question.score

      if question_score == nil
        question_score = 1
      end

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
    @user_quiz = UserQuiz.create(user_id: current_user.id, quiz_id: params[:quiz_id], score: @nota)
    @user_quiz.save

    respond_to do |format|
      format.html { render 'evaluate' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quiz
    @quiz = Quiz.find(params[:id])
  end

  def set_discipline
    @discipline = Discipline.find(params[:discipline_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_params
    params.require(:quiz).permit(:name,
                                  questions_attributes: [:id, :statement , :score, :_destroy,
                                  answers_attributes:   [:id, :text, :correct_option, :_destroy]  ] )
  end
end
