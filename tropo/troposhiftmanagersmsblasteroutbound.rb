call $recipient, {
   :network => "SMS",
   :callerID => '+15812226030'}
say 'Tropo Shift Manager: Are you able to come in now for the ' + $shift + '?' + ' Reply with ' + $access_code + ' and your name to confirm!'