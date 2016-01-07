require 'twilio-ruby'
 
# put your own credentials here - from twilio.com/user/account
account_sid = 'ACc50d87fd1b490071772d7ce368c9bbf0'
auth_token = '1a034db3b854380b7f66492efad4108e'
 
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token
 
@call = @client.account.calls.create(
  :from => '+17329835295',   # From your Twilio number
  :to => '+17329836241',     # To any number
  # Fetch instructions from this URL when the call connects
  :url => 'http://twimlets.com/holdmusic?Bucket=com.twilio.music.ambient'
)