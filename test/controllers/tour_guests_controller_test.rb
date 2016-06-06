require 'test_helper'

class TourGuestsControllerTest < ActionController::TestCase
  setup do
    @tour_guest = tour_guests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tour_guests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tour_guest" do
    assert_difference('TourGuest.count') do
      post :create, tour_guest: { guest_id: @tour_guest.guest_id, tour_id: @tour_guest.tour_id }
    end

    assert_redirected_to tour_guest_path(assigns(:tour_guest))
  end

  test "should show tour_guest" do
    get :show, id: @tour_guest
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tour_guest
    assert_response :success
  end

  test "should update tour_guest" do
    patch :update, id: @tour_guest, tour_guest: { guest_id: @tour_guest.guest_id, tour_id: @tour_guest.tour_id }
    assert_redirected_to tour_guest_path(assigns(:tour_guest))
  end

  test "should destroy tour_guest" do
    assert_difference('TourGuest.count', -1) do
      delete :destroy, id: @tour_guest
    end

    assert_redirected_to tour_guests_path
  end
end
