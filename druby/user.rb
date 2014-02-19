require 'drb/drb'

class User
  include DRbUndumped

  attr_accessor :username

  def initialize(username)
    @username = username
  end

  def message(str)
    puts str
  end
end
