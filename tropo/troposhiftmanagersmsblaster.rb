require 'net/http'
require 'net/https'
require 'json'
require 'uri'

sms_payload = $currentCall.initialText.split(" ")
access_code_passed = sms_payload[0]
name = " "

for index in 1 ... sms_payload.size
        name = name + sms_payload[index] + " "
end
    str_rep_uri = "https://troposhiftmanager.herokuapp.com/update_absense_by_access_code/" + access_code_passed + "/"
    log 'URL-------- ' + str_rep_uri 
    uri = URI(str_rep_uri)
    # Create client
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    dict = {
            "access_code" => access_code_passed,
            "replacement_employee" => name
        }
    body = JSON.dump(dict)

    # Create Request
    req =  Net::HTTP::Post.new(uri.request_uri)
    # Add headers
    req.add_field "Content-Type", "application/json"
    # Set header and body
    req.body = body

    # Fetch Request
    res = http.request(req)

say 'Shift Confirmed: Thanks ' + name + ' we will see you shortly.'

wait 5000
say 'TropoShiftManager: Your employee ' + name + ' has agreed to cover the and will be starting in 30 minutes'
