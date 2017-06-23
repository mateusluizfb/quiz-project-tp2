class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    check_admin
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    check_user(@user)
  end

  # GET /users/new
  def new
    check_admin
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    check_user(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update # rubocop:disable Metrics/AbcSize
    params[:user].delete(:password) if params[:user][:password].blank?

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def history
    @user = current_user
    @quizzes = UserQuiz.where(user_id: current_user.id)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :login, :password, :password_confirmation, :admin)
  end

  def check_admin
    redirect_to dashboard_path unless current_user.admin?
  end

  def check_user(user)
    redirect_to dashboard_path if current_user != user
  end
end
