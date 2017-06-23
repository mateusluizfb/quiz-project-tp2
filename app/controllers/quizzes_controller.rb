class QuizzesController < ApplicationController
  before_action :set_discipline, except: [:evaluate]
  before_action :set_topic, except: [:evaluate]
  before_action :set_quiz, only: %i[show edit update destroy]
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
  def create # rubocop:disable Metrics/AbcSize
    @quiz = @topic.quizzes.build(quiz_params)
    respond_to do |format|
      if @quiz.save
        format.html {
          redirect_to discipline_topic_quiz_path(@discipline, @topic, @quiz), notice: 'Quiz was successfully created.'
        }
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
        format.html {
          redirect_to discipline_topic_quiz_path(@discipline, @topic, @quiz), notice: 'Quiz was successfully updated.'
        }
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
      format.html {
        redirect_to discipline_topic_quizzes_path(@discipline, @topic), notice: 'Quiz was successfully destroyed.'
      }
      format.json { head :no_content }
    end
  end

  def evaluate
    evaluation = Quiz.evaluate(params[:questions], current_user, params[:quiz_id])
    @answers = evaluation[:answers]
    @nota = evaluation[:nota]

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
                                  questions_attributes: %i[id statement score _destroy
                                  answers_attributes: %i[id text correct_option _destroy]])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
