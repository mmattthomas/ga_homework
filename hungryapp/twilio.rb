require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACa76cef3f3fabc5e85a8cb02244e34755'
auth_token  = '3434b116d6d37536596d8553067de4fc'

# set up a client to talk to the Twilio REST API
client = Twilio::REST::Client.new account_sid, auth_token

# send sms
client.account.messages.create(
  :from => '+13236294399',
  :to => '+13239634649',
  :body => 'Howdy, here is a message'
)