selector = NIO::Selector.new

loop do
  selector.select do |_monitor|
    server = TCPServer.new('localhost', 1234)
    selector.register(server, :r)

    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)

    begin
      socket.connect_nonblock Socket.sockaddr_in(remote_port, remote_addr)
    rescue Errno::EINPROGRESS
      selector.register(socket, :w)
    end
    selector.select do |monitor|
      case monitor.io
      when TCPServer
        monitor.io.accept_nonblock if monitor.readable?
      end
    end
  end
end
