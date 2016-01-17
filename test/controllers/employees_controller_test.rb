require 'test_helper'

class EmployeesControllerTest < ActionController::TestCase
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:employees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { employee_number: @employee.employee_number, first_name: @employee.first_name, friday_shift: @employee.friday_shift, mobile_number: @employee.mobile_number, monday_shift: @employee.monday_shift, saturday_shift: @employee.saturday_shift, security_pin: @employee.security_pin, sunday_shift: @employee.sunday_shift, surname: @employee.surname, thursday_shift: @employee.thursday_shift, tuesday_shift: @employee.tuesday_shift, wednesday_shift: @employee.wednesday_shift }
    end

    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should show employee" do
    get :show, id: @employee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @employee
    assert_response :success
  end

  test "should update employee" do
    patch :update, id: @employee, employee: { employee_number: @employee.employee_number, first_name: @employee.first_name, friday_shift: @employee.friday_shift, mobile_number: @employee.mobile_number, monday_shift: @employee.monday_shift, saturday_shift: @employee.saturday_shift, security_pin: @employee.security_pin, sunday_shift: @employee.sunday_shift, surname: @employee.surname, thursday_shift: @employee.thursday_shift, tuesday_shift: @employee.tuesday_shift, wednesday_shift: @employee.wednesday_shift }
    assert_redirected_to employee_path(assigns(:employee))
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete :destroy, id: @employee
    end

    assert_redirected_to employees_path
  end
end
