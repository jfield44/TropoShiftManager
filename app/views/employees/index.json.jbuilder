json.array!(@employees) do |employee|
  json.extract! employee, :id, :employee_number, :first_name, :surname, :security_pin, :mobile_number, :monday_shift, :tuesday_shift, :wednesday_shift, :thursday_shift, :friday_shift, :saturday_shift, :sunday_shift
  json.url employee_url(employee, format: :json)
end
