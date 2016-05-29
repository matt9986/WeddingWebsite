class GuestsController < ApplicationController
  before_filter :user_in_wedding_party, only: [:index]
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  def find
    first_or_alias = params[:first].downcase
    @guest = Guest.where("lower(last) LIKE ?", params[:last].downcase).where(
                        "lower(first) LIKE ? OR lower(alias) LIKE ?", first_or_alias, first_or_alias).first
    respond_to do |format|
      if @guest
        format.html { redirect_to @guest }
        format.json { render :show, location: @guest }
      else
        raise "Nope"
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: '#{@guest.first} was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: '#{@guest.first} was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: '#{@guest.first} was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:first, :last, :alias)
    end

    def user_in_wedding_party
      redirect_to new_user_session_path unless current_user.present?
      redirect_to exhibits_path if current_user.present? && !current_user.in_wedding_party?
    end
end
