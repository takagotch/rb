require "socket"
p Socket.gethostname


require "socket"
def lookup_ipaddr(host, family = Socket::AF_UNSPEC)
  Socket.getaddrinfo(host, nil, family)[0][3]
end
def reverse_lookup(ip)
  Socket.getnameinfo({Socket::AF_UNSPEC, 0, ip})[0]
end
p lookup_ipaddr("host1")
p lookup_ipaddr("192.168.33.1")
p lookup_ipaddr("localhost", Socket::AF_INET)
p lookup_ipaddr("localhost", Socket::AF_INET6)
p lookup_ipaddr("192.168.33.1")
p lookup_ipaddr("127.0.0.1")
p lookup_ipaddr("::1")

#http://localhost/
require "socket"
TCPSocket.open("localhost", 80) so |s|
  s.print "GET / HTTP/1.0\r\n\r\n"
  print s.read
end

require "socket"
begin
  s = TCPSocket.open("localhost", 80)
  s.print "GET / HTTP/1.0\r\n\r\n"
  print s.read
ensure
  s.close if so
end


require "socket"
port = 8888
server = TCPServer.new("0.0.0.0", port)
loop do
  Thread.fork(server.accept) do |sock|
    begin
      #...socket handring
    ensure
      sock.close unless sock.close?
    end
  end
end


require "webick"
class FooServer < WEBrick::GenericServer
  def run(sock)
    #socket handring
  end
end

server = FooServer.new(:Port => 8000)
trap(:INT){ server.shutdown }  
server.start


require "socket"
port = 8888
servers = Socket.getaddrinfo(nil, port, nil, Socket::SOCK_STREAM,
                             nil, Socket::AI_PASSIVE).map do
    |family, service, host, ipaddr, *|
  TCPServer.new(ipaddr, port)
end
while true
  r, w, ex = *IO.select(servers)
  r.each do |server|
    Thread.fork(server.accept) do |sock|
	  begin
	    #socket handring
	  ensure
	    sock.close unless sock.close?
	  end
	end
  end
end

require "open-uri"
open("http://www.example.com/") do |f|
  print f.read
end

require "net/http"
Net::HTTP.start("www.example.com", 80) do |http|
  response = http.post("/cgi-bin/echo.cgi", "msg=test",
    {"Content-Type" => "application/x-www-form-urlencoded"})
end


require "net/http"
httpclass = Net::HTTP.Proxy("proxy.example.com", 3128)
httpclass.start("www.example.com", 80) do |http|
  response = http.get("/")
  print response.body
end


require "httpclient"
client = HTTPClient.new('http://myproxy:8080')
body = {'msg' = 'test'}
p client.post("http://www.example.com/cgi-bin/echo.cgi", body)


require "net/smtp"
require "time"

smtp_server = "mail.example.com"
from = "takagotch@gmail.com"
to = "example@gmail.com"
Net::SMTP.start(smtp_server) do |smtp|
  smtp.send_mail <<-EndMessage, from, [to]
From:
To:
Date:
Subject: test message

Hello, Ruby World!
  EndMessage
end



require "net/ftp"

ftp_server = 'tukumo'
user = 'takagotch'
password = 'pass'
target = '/home/takagotch/test1.dat'
Net::FTP.open(ftp_server) do |ftp|
  #ftp.debug_mode = true
  ftp.login user, password
  p ftp.list('.')
  ftp.getbinaryfile target
  ftp.quit
end


require "net/ssh"

ssh_server = "tukumo"
user = "takagotch"
password =  "pass"
Net::SSH.start(ssh_server, user, :password => password) do |ssh|
  cmd_ch = ssh.open_channel do |ch|
    ch.exec("ls -l") do |__, success| 
	  raise IOError, "remote exec failed" unless success
	  ch.on_data do |__, data|
	    $stdout.print data
	  end
	  ch.on_extended_data do |__, type, data|
	    $stderr.print data
	  end
	  ch.on_extended_data do |__, data|
	    $stderr.puts "status: #{data.read_long}"
	  end
	  ch.on_request("exit-status") do |__, data|
	    $stderr.puts "signal: #{data.read_string}"
	  end
    end
  end
end




require "ldap"

ldap_server = "localhost"
ldap = LDAP::Conn.new(ldap_server)
ldap.set_option LDAP::LDAP_OPTPROTOCOL_VERSION, 3
ldap.simple_bind do
  ldap.search2("dc=my-domain,dc=com")
    LDAP::LDAP_SCOPE_BASE, "(objectClass=*)") do |entry|
	  p entry
	  #
  end
end



require "socket"
require "timeout"

def host_alive?(host, timeout_sec = 5, service = 7)
  timeout(timeout_sec) do
    TCPSocket.open(host, service) {}
  end
  true
rescue Errno::ECONNREFUSED
  return true
rescue Timeout::Error, StandardError
  return false
end



require "drb"
obj = ["drb", "server"]
DRb.start_service("druby:/localhost:2222", obj)
DRb.thred.join



require "drb"
DRb.start_service
obj = DRbObject.new_with_uri("druby://localhost:2222")
obj.each do |i|
  p i
end


>ruby drvserver.rb
>ruby drvclient.rb