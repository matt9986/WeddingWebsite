class TourGuestsController < ApplicationController
  before_action :set_tour_guest, only: [:show, :edit, :update, :destroy]

  # GET /tour_guests
  # GET /tour_guests.json
  def index
    @tour_guests = TourGuest.all
  end

  # GET /tour_guests/1
  # GET /tour_guests/1.json
  def show
  end

  # GET /tour_guests/new
  def new
    @tour_guest = TourGuest.new
  end

  # GET /tour_guests/1/edit
  def edit
  end

  # POST /tour_guests
  # POST /tour_guests.json
  def create
    @tour_guest = TourGuest.new(tour_guest_params)

    respond_to do |format|
      if @tour_guest.save
        format.html { redirect_to @tour_guest, notice: 'Tour guest was successfully created.' }
        format.json { render :show, status: :created, location: @tour_guest }
      else
        format.html { render :new }
        format.json { render json: @tour_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_guests/1
  # PATCH/PUT /tour_guests/1.json
  def update
    respond_to do |format|
      if @tour_guest.update(tour_guest_params)
        format.html { redirect_to @tour_guest, notice: 'Tour guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_guest }
      else
        format.html { render :edit }
        format.json { render json: @tour_guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_guests/1
  # DELETE /tour_guests/1.json
  def destroy
    @tour_guest.destroy
    respond_to do |format|
      format.html { redirect_to tour_guests_url, notice: 'Tour guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_guest
      @tour_guest = TourGuest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_guest_params
      params.require(:tour_guest).permit(:tour_id, :guest_id)
    end
end
