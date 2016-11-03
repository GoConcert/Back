class MusicStylesController < ApplicationController
  before_action :set_music_style, only: [:show, :edit, :update, :destroy]

  # GET /music_styles
  # GET /music_styles.json
  def index
    @music_styles = MusicStyle.all
  end

  # GET /music_styles/1
  # GET /music_styles/1.json
  def show
  end

  # GET /music_styles/new
  def new
    @music_style = MusicStyle.new
  end

  # GET /music_styles/1/edit
  def edit
  end

  # POST /music_styles
  # POST /music_styles.json
  def create
    @music_style = MusicStyle.new(music_style_params)

    respond_to do |format|
      if @music_style.save
        format.html { redirect_to @music_style, notice: 'Music style was successfully created.' }
        format.json { render :show, status: :created, location: @music_style }
      else
        format.html { render :new }
        format.json { render json: @music_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /music_styles/1
  # PATCH/PUT /music_styles/1.json
  def update
    respond_to do |format|
      if @music_style.update(music_style_params)
        format.html { redirect_to @music_style, notice: 'Music style was successfully updated.' }
        format.json { render :show, status: :ok, location: @music_style }
      else
        format.html { render :edit }
        format.json { render json: @music_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /music_styles/1
  # DELETE /music_styles/1.json
  def destroy
    @music_style.destroy
    respond_to do |format|
      format.html { redirect_to music_styles_url, notice: 'Music style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
	@music_styles=MusicStyle.where(name: params[:name])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music_style
      @music_style = MusicStyle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_style_params
      params.require(:music_style).permit(:name, :description)
    end
end
