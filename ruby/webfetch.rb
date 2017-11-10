require 'socket'

host = 'www.example.com'
port = 80
path = "/index.html"

request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)
socket.print(request)
response = socket.read
headers,body = respone.split("\r\n\r\n", 2)
print body


require 'net/http'
host = 'www.example.com'
path = '/index.html'
http = Net::HTTP.new(host)
headers, body = http.get(path)
if headers.code == "200"
  
  print body
else
  puts "#{headers.code} #{headers.message}"
end

require 'open-uri'
open("http://www.example.com/index.html"){|f|
  puts f.read
}