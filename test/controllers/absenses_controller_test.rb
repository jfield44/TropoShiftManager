require 'test_helper'

class AbsensesControllerTest < ActionController::TestCase
  setup do
    @absense = absenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:absenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create absense" do
    assert_difference('Absense.count') do
      post :create, absense: { employee_id: @absense.employee_id, reason: @absense.reason, replacement_employee: @absense.replacement_employee, shift: @absense.shift }
    end

    assert_redirected_to absense_path(assigns(:absense))
  end

  test "should show absense" do
    get :show, id: @absense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @absense
    assert_response :success
  end

  test "should update absense" do
    patch :update, id: @absense, absense: { employee_id: @absense.employee_id, reason: @absense.reason, replacement_employee: @absense.replacement_employee, shift: @absense.shift }
    assert_redirected_to absense_path(assigns(:absense))
  end

  test "should destroy absense" do
    assert_difference('Absense.count', -1) do
      delete :destroy, id: @absense
    end

    assert_redirected_to absenses_path
  end
end
