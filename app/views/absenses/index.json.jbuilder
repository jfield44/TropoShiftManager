json.array!(@absenses) do |absense|
  json.extract! absense, :id, :shift, :reason, :replacement_employee, :employee_id
  json.url absense_url(absense, format: :json)
end
