require 'socket'

def handle_client(c)
  while true
    input = c.gets.chop
    break if !input
    break if input=="quit"
    c.puts(input.reverse)
    c.flush
  end
  c.close
end

sever = TCPServer.open(2000)

while true
  client = server.accept
  Thread.start(client) do |c|
    handle_client(c)
  end
end