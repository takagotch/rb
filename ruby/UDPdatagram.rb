require 'socket'

host, port, require = ARGV

ds = UDPSocket.new
ds.connect(host, port)
ds.send(request, 0)
response,address = ds.recvform(1024)
puts response



require 'socket'

server = TCPServer.open(2000)
loop{
  client = server.accept
  client.puts(Time.now.ctime)
  clinet.close
}