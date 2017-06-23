##
# This class is used to control the requisitions Topic gets through its views.

class TopicsController < ApplicationController
  before_action :set_discipline
  before_action :authenticate_user!
  before_action :set_topic, only: %i[show edit update destroy]

  ##
  # Shows index of all topics.
  # GET /topics
  # GET /topics.json
  def index
    @topics = @discipline.topics
  end

  ##
  # Shows an specific topic.
  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  ##
  # Form to create new topic.
  # GET /topics/new
  def new
    @topic = Topic.new
  end

  ##
  # Edit specific topic.
  # GET /topics/1/edit
  def edit
  end

  ##
  # Creates an topic and tries to save it to the database.
  # POST /topics
  # POST /topics.json
  def create # rubocop:disable Metrics/AbcSize
    @topic = @discipline.topics.build(topic_params)
    respond_to do |format|
      if @topic.save
        format.html {
          redirect_to discipline_topic_path(@discipline, @topic), notice: 'Topic was successfully created.'
        }
        format.json { render :show, status: :created, location: @topic }
      else
        format.html { render :new }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Updates topic on database.
  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html {
          redirect_to discipline_topic_path(@discipline, @topic), notice: 'Topic was successfully updated.'
        }
        format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Associates a Topic to an User's Topics.
  def associate
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      current_user.topics << @topic
      format.js
    end
  end

  ##
  # Disassociates a Topic to an User's Topics.
  def disassociate
    @topic = Topic.find(params[:topic_id])

    respond_to do |format|
      current_user.topics.delete(@topic)
      format.js
    end
  end

  ##
  # Deletes specific topic.
  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to discipline_topics_path(@discipline), notice: 'Topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_discipline
    @discipline = Discipline.find(params[:discipline_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_topic
    @topic = Topic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def topic_params
    params.require(:topic).permit(:name, quizzes_attributes: %i[id name _destroy])
  end
end
