require 'test_helper'

class AbsenceBlastersControllerTest < ActionController::TestCase
  setup do
    @absence_blaster = absence_blasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absence_blasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create absence_blaster" do
    assert_difference('AbsenceBlaster.count') do
      post :create, absence_blaster: { absence_id: @absence_blaster.absence_id, access_code: @absence_blaster.access_code, recipient_name: @absence_blaster.recipient_name, recipient_number: @absence_blaster.recipient_number, shift: @absence_blaster.shift }
    end

    assert_redirected_to absence_blaster_path(assigns(:absence_blaster))
  end

  test "should show absence_blaster" do
    get :show, id: @absence_blaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @absence_blaster
    assert_response :success
  end

  test "should update absence_blaster" do
    patch :update, id: @absence_blaster, absence_blaster: { absence_id: @absence_blaster.absence_id, access_code: @absence_blaster.access_code, recipient_name: @absence_blaster.recipient_name, recipient_number: @absence_blaster.recipient_number, shift: @absence_blaster.shift }
    assert_redirected_to absence_blaster_path(assigns(:absence_blaster))
  end

  test "should destroy absence_blaster" do
    assert_difference('AbsenceBlaster.count', -1) do
      delete :destroy, id: @absence_blaster
    end

    assert_redirected_to absence_blasters_path
  end
end
