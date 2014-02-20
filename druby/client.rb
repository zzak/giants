require 'drb/drb'
require_relative 'server'

class Client
  # Makes an instance of Client undumpable or unmarshallable.
  #
  # When a method any Client instance method is called over drb, then the
  # object instance remains in the server space and a reference to the object
  # is returned, rather than the object being marshalled.
  include DRbUndumped

  attr_accessor :username, :remote, :server

  def initialize(server, remote)
    @server = server
    @remote = remote
    @username = remote.username
  end

  def say(message)
    @server.distribute(@remote, message)
  end

  def listen(message)
    @remote.say(message)
  end
end

# Start a dRuby server locally.
#
# After binding the drb server, Server is where remote method calls on the drb
# server will be passed.
DRb.start_service 'druby://localhost:12345', Server.new

# The calling thread will suspend execution and run the thread for the druby
# primary server.
#
# Does not return until the primary server thread exits
# or until the given limit seconds have passed.
#
# If the time limit expires, nil will be returned, otherwise thr is returned.
#
# Any threads not joined will be killed when the main program exits.
DRb.thread.join
