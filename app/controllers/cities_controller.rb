class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    if params[:cat]
      @events = Event.where(event_type: params[:cat])
    else
      @events = Event.all
    end
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.location_latitude
      marker.lng event.location_longitude
      marker.infowindow "<b>" + event.name + "</b></br>" + event.location_name\
      + "</br>" + "<a href=http://#{event.url}>More info</a>"
      if event.event_type == 'Hotel'
        url = 'https://raw.githubusercontent.com/Virjanand/LGBT-FLF/master/lib/assets/images/hotel.ico'
      elsif event.event_type == 'Event'
        url = 'assets/hotel.png'
      elsif event.event_type == 'Bar'
        url = 'assets/hotel.png'
      elsif event.event_type == 'Taxi'
        url = 'assets/hotel.png'
      end
      marker.picture({
        "url" => url,
        "width" =>  32,
        "height" => 32
        })
      end
    end

    # GET /cities/new
    def new
      @city = City.new
    end

    # GET /cities/1/edit
    def edit
    end

    # POST /cities
    # POST /cities.json
    def create
      @city = City.new(city_params)

      respond_to do |format|
        if @city.save
          format.html { redirect_to @city, notice: 'City was successfully created.' }
          format.json { render :show, status: :created, location: @city }
        else
          format.html { render :new }
          format.json { render json: @city.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /cities/1
    # PATCH/PUT /cities/1.json
    def update
      respond_to do |format|
        if @city.update(city_params)
          format.html { redirect_to @city, notice: 'City was successfully updated.' }
          format.json { render :show, status: :ok, location: @city }
        else
          format.html { render :edit }
          format.json { render json: @city.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /cities/1
    # DELETE /cities/1.json
    def destroy
      @city.destroy
      respond_to do |format|
        format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :rating, :booking_id)
    end
  end
