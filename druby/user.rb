class User
  include DRbUndumped

  attr_accessor :username

  def initialize(username)
    @username = username
  end

  def say(message)
    puts message
  end
end
