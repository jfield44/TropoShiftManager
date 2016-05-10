require 'open-uri'
require 'json'

say "Hello and welcome to the Tropo Shift Manager"
result = ask "Please enter your six digit Employee identification number", {
 :choices => "[6 DIGITS]"}

say "Thank you for entering your employee number"

shift_day = ask "For which day would you like to check your Shift times? Press 1 for Monday. 2 for Tuesday. 3 for Wednesday. 4 for Thursday. 5 for Friday. 6 for Saturday. Or 7 for Sunday.", {
 :choices => "[1 DIGIT]"}

shift_days = {"1" => "Monday", "2" => "Tuesday", "3" => "Wednesday", "4" => "Thursday", "5" => "Friday", "6" => "Saturday", "7" => "Sunday"}
shift_hours = {"Early Shift" => "9am in the morning until 1pm in the afternoon", "Midday Shift" => "11am in the morning until 4pm in the afternoon", "Late Shift" => "4pm in the afternoon until 9pm at night"}
say "Just a moment. We are retrieving your working hours for " + shift_days[shift_day.value]

uri = ('https://troposhiftmanager.herokuapp.com/employee_shift_details/' + result.value + '.json')

response = open(uri).read

employee_data = JSON.parse(response)

param_name = shift_days[shift_day.value].downcase + "_shift"

say "Okay " + employee_data['first_name'] + " your shift for " + shift_days[shift_day.value] + " your working hours are from " + shift_hours[employee_data[param_name]] + "Thank you for using Tropo Shift Manager"

further_action = ask "Do you wish to report an absense for your " + shift_days[shift_day.value]  + " shift? Press 1 for Yes or Press 2 to Hangup", {
 :choices => "[1 DIGIT]"}
 
if further_action.value == "1"

say "What is the reason for the absense?"
wait 1000
absense_reason = ask "Press 1 if you are ill, Press 2 if you do not wish to specific a reason for the absense", {
 :choices => "[1 DIGIT]"}
hangup
else	
hangup
call employee_data['mobile_number'], {
   :network => "SMS"}
say "Your shift for " + shift_days[shift_day.value] + " is the " + employee_data[param_name]
end



