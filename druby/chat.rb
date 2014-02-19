require 'drb/drb'
require_relative 'user'

remote = 'druby://localhost:12345'
print "What's your username? "
username = gets.chomp
DRb.start_service

remote_object = DRbObject.new(nil, remote)
chat = User.new(username)
entry = remote_object.add_user(chat)

while gets
  entry.say($_)
end
