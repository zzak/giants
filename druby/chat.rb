require 'drb/drb'
require_relative 'user'

print "What's your username? "
username = gets.chomp
DRb.start_service

# Create a new remote object stub.
#
# Since we're not stubbing a local object, we pass nil.
#
# Then connect to the druby server which returns a remote instance of the
# Server object.
remote = DRbObject.new(nil, 'druby://localhost:12345')
user = User.new(username)
client = remote.add_user(user)

while gets
  client.say($_)
end
