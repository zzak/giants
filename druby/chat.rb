require 'drb/drb'
require_relative 'user'

remote = 'druby://localhost:12345'
print "What's your username? "
username = gets.chomp
DRb.start_service

# Create a new remote object stub.
#
# Since we're not stubbing a local object, we pass nil.
#
# Then connect to the druby server which returns a remote instance of the
# Server object.
remote_object = DRbObject.new(nil, remote)
user = User.new(username)
client = remote_object.add_user(user)

while gets
  client.say($_)
end