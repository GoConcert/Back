class ConcertPreferencesController < ApplicationController
  before_action :set_concert_preference, only: [:show, :edit, :update, :destroy]

  # GET /concert_preferences
  # GET /concert_preferences.json
  def index
    @concert_preferences = ConcertPreference.all
  end

  # GET /concert_preferences/1
  # GET /concert_preferences/1.json
  def show
  end

  # GET /concert_preferences/new
  def new
    @concert_preference = ConcertPreference.new
  end

  # GET /concert_preferences/1/edit
  def edit
  end

  # POST /concert_preferences
  # POST /concert_preferences.json
  def create
    @concert_preference = ConcertPreference.new(concert_preference_params)

    respond_to do |format|
      if @concert_preference.save
        format.html { redirect_to @concert_preference, notice: 'Concert preference was successfully created.' }
        format.json { render :show, status: :created, location: @concert_preference }
      else
        format.html { render :new }
        format.json { render json: @concert_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concert_preferences/1
  # PATCH/PUT /concert_preferences/1.json
  def update
    respond_to do |format|
      if @concert_preference.update(concert_preference_params)
        format.html { redirect_to @concert_preference, notice: 'Concert preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert_preference }
      else
        format.html { render :edit }
        format.json { render json: @concert_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concert_preferences/1
  # DELETE /concert_preferences/1.json
  def destroy
    @concert_preference.destroy
    respond_to do |format|
      format.html { redirect_to concert_preferences_url, notice: 'Concert preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
	@concert_preferences=ConcertPreference.where(style_id: params[:style_id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert_preference
      @concert_preference = ConcertPreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_preference_params
      params.require(:concert_preference).permit(:concert_id, :style_id, :order)
    end
end
