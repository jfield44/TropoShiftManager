require 'open-uri'
require 'json'

sms_payload = $currentCall.initialText.split(" ")
employee_id = sms_payload[0]
shift_to_check = sms_payload[1]


shift_hours = {"Early Shift" => "9am - 1pm", "Midday Shift" => "11am - 4pm", "Late Shift" => "4pm - 9pm"}

uri = ('https://troposhiftmanager.herokuapp.com/employee_shift_details/' + employee_id + '.json')

response = open(uri).read

employee_data = JSON.parse(response)

if shift_to_check == "weekly" || shift_to_check == "Weekly"
	say employee_data['first_name'] + " your shifts for the week are: " + "Mon " + shift_hours[employee_data['monday_shift']] + ". Tues " + shift_hours[employee_data['tuesday_shift']] + ". Weds " + shift_hours[employee_data['wednesday_shift']] + ". Thurs " + shift_hours[employee_data['thursday_shift']] + ". Fri " + shift_hours[employee_data['friday_shift']] + ". Sat " + shift_hours[employee_data['saturday_shift']] + ". Sun " + shift_hours[employee_data['sunday_shift']]
else
	param_name = shift_to_check.downcase + "_shift"
	say employee_data['first_name'] + " your shift for " + shift_to_check + " is the " + employee_data[param_name] + " .Thank you for using Tropo Shift Manager"
end

wait 15000
say "Shift Reminder: Remember you are working the early shift today (9am - 1pm)"