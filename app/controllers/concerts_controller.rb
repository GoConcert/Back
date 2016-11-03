class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show, :edit, :update, :destroy, :reservation]


  skip_before_action :verify_authenticity_token, only: [:reservation]

  # GET /concerts
  # GET /concerts.json
  def index
    @concerts = Concert.all
  end

  # GET /concerts/1
  # GET /concerts/1.json
  def show
     @concerts = Concert.find(params[:id])
  end

  # GET /concerts/new
  def new
    @concert = Concert.new
  end

  # GET /concerts/1/edit
  def edit
  end

  # POST /concerts
  # POST /concerts.json
  def create
    @concert = Concert.new(concert_params)

    respond_to do |format|
      if @concert.save
        format.html { redirect_to @concert, notice: 'Concert was successfully created.' }
        format.json { render :show, status: :created, location: @concert }
      else
        format.html { render :new }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /concerts/1
  # PATCH/PUT /concerts/1.json
  def update
    respond_to do |format|
      if @concert.update(concert_params)
        format.html { redirect_to @concert, notice: 'Concert was successfully updated.' }
        format.json { render :show, status: :ok, location: @concert }
      else
        format.html { render :edit }
        format.json { render json: @concert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /concerts/1
  # DELETE /concerts/1.json
  def destroy
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to concerts_url, notice: 'Concert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /concerts/1/book.json
  def reservation
    # On crée un nouvel objet reservation à partir des paramètres reçus
    @reservation = Reservation.new(reservation_params)
    # On précise que cet object Reservation dépend du Concert concerné
    @reservation.concert = @concert

    respond_to do |format|
      if @reservation.save
        format.json
      else
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
	if params[:location] 
	then 
	concerts=Concert.where("lower(location) = ?", params[:location].downcase)
	#then concerts=Concert.where(location: params[:location.downcase])
	else concerts=Concert
	end

	if  params[:music_style]
	then
	music_styles=MusicStyle.where(name: params[:music_style])
	style_id=music_styles.first.id
	concert_preferences=ConcertPreference.where(style_id: style_id)
	concert_ids=[]
	concert_preferences.each do |concert_preference|
	concert_ids << concert_preference.concert_id
	end
	concerts = concerts.where(id: concert_ids)
	end
	
	@concerts=concerts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_concert
      @concert = Concert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def concert_params
      params.require(:concert).permit(:title, :location, :description, :capacity, :price, :image, :date)
    end

    # On ajoute les paramètres qu'on va envoyer avec la reservation
    def reservation_params
      params.require(:reservation).permit(:user_id, :nb_people)
    end

end
