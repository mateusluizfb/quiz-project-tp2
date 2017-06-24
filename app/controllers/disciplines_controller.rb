##
# This class is used to control the requisitions Discipline gets through its views.

class DisciplinesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_discipline, only: %i[show edit update destroy]

  ##
  # Shows index of all disciplines.
  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = Discipline.all
  end

  ##
  # Shows an specific discipline.
  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  ##
  # Form to create new discipline.
  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  ##
  # Edit specific discipline.
  # GET /disciplines/1/edit
  def edit
  end

  ##
  # Creates a discipline and tries to save it to the database.
  # POST /disciplines
  # POST /disciplines.json
  def create # rubocop:disable Metrics/AbcSize
    @discipline = Discipline.new(discipline_params)

    respond_to do |format|
      if @discipline.save
        current_user.notebook.disciplines << @discipline
        format.html { redirect_to @discipline, notice: 'Discipline was successfully created.' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Updates discipline on database.
  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Discipline was successfully updated.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # Associates Discipline to an User's Notebook.
  def associate
    @discipline = Discipline.find(params[:discipline_id])

    respond_to do |format|
      current_user.notebook.disciplines << @discipline
      format.js
    end
  end

  ##
  # Disassociates Discipline to an User's Notebook.
  def disassociate
    @discipline = Discipline.find(params[:discipline_id])

    respond_to do |format|
      current_user.notebook.disciplines.delete(@discipline)
      format.js
    end
  end

  ##
  # Exports specific Discipline. Exporting process documented in DisciplinesHelper.
  def export
    @discipline = Discipline.find(params[:discipline_id])

    send_file(export_discipline(@discipline))
  end

  ##
  # Exports list of all Disciplines. Exporting process documented in DisciplinesHelper.
  def export_all
    send_file(export_disciplines(Discipline.all))
  end

  ##
  # Deletes specific discipline.
  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.topics.delete_all
    @discipline.destroy

    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_discipline
    @discipline = Discipline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def discipline_params
    params.require(:discipline).permit(:name, topics_attributes: %i[id name _destroy])
  end
end
