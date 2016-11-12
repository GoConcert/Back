class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
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
  def update
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

  def search
	if params[:user_name]
	    then
	    user=User.where(user_name: params[:user_name])
	else
	    user = nil
	end

	music_styles = []
    if user.nil?
    then
        @user = nil
    else
        if  params[:password].nil?
        then
            @user = nil
        else
            user=User.where(password: params[:password])
            if user.first != nil
            then
                @user=user.first
                user_preferences=UserPreference.where(user_id: user.first.id)
                styles_ids = []
                user_preferences.each do |pref|
                    styles_ids << pref.style_id
                end
                music_styles = []
                styles_ids.each do |id|
                    music_styles << MusicStyle.where(id: id)
                end
                @music_styles=music_styles
            else
                @user=nil
            end
        end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name, :email, :password, :first_name, :last_name, :location)
    end
end
