require 'twilio-ruby'

account_sid = "ACc50d87fd1b490071772d7ce368c9bbf0"
auth_token = "1a034db3b854380b7f66492efad4108e"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+17329835295" # Your Twilio number
 
friends = {
	"+17329836241" => "Chaz"
}

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, I just sent you this message through the ruby command line using the Twilio API",
  )
  puts "Sent message to #{value}"
end