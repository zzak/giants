class Server
  attr_accessor :messages
  attr_accessor :users

  def initialize
    @messages = {}
    @users = {}
  end

  def add_user remote
    client = Client.new self, remote
    @users[remote] = client
    client
  end

  def distribute(remote, message)
    username = @users[remote].username
    @users.keys.each do |m|
      begin
        @users[m].listen "#{username}: #{message}"
      rescue
        p $!
        @users.delete(m)
      end
    end
  end
end
