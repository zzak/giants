class Server
  attr_accessor :messages, :users

  def initialize
    @messages, @users = {}, {}
  end

  def add_user remote
    @users[remote] = Client.new self, remote
    return @users[remote]
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
