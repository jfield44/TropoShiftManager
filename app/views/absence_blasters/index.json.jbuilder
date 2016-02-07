json.array!(@absence_blasters) do |absence_blaster|
  json.extract! absence_blaster, :id, :recipient_name, :recipient_number, :shift, :access_code, :absense_id
  json.url absence_blaster_url(absence_blaster, format: :json)
end
