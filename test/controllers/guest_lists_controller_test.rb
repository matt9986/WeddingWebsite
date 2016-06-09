require 'test_helper'

class GuestListsControllerTest < ActionController::TestCase
  setup do
    @guest_list = guest_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guest_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest_list" do
    assert_difference('GuestList.count') do
      post :create, guest_list: {  }
    end

    assert_redirected_to guest_list_path(assigns(:guest_list))
  end

  test "should show guest_list" do
    get :show, id: @guest_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guest_list
    assert_response :success
  end

  test "should update guest_list" do
    patch :update, id: @guest_list, guest_list: {  }
    assert_redirected_to guest_list_path(assigns(:guest_list))
  end

  test "should destroy guest_list" do
    assert_difference('GuestList.count', -1) do
      delete :destroy, id: @guest_list
    end

    assert_redirected_to guest_lists_path
  end
end
