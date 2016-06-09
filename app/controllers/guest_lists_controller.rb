class GuestListsController < ApplicationController
  before_filter :user_in_wedding_party

  # GET /guest_lists/new
  def new
    @guest_list = GuestList.new
  end

  # POST /guest_lists
  # POST /guest_lists.json
  def create
    @guest_list = GuestList.new(guest_list_params)

    respond_to do |format|
      if @guest_list.save
        format.html { redirect_to guests_path, notice: "Guest list was successfully created. #{@guest_list.guest_count} guests added" }
        format.json { render :show, status: :created, location: @guest_list }
      else
        format.html { render :new }
        format.json { render json: @guest_list.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_list_params
      params.require(:guest_list).permit(:csv_file)
    end

    def user_in_wedding_party
      raise ActionController::RoutingError.new('Not Found') unless current_user.present? && current_user.in_wedding_party?
    end
end
