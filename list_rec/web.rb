require "rss"

url = "http://www.ruby-lang.org/ja/feeds/news.rss"
rss = RSS:Parser.parse(url)
puts "Title:" + rss.channel.title
puts "Desc:" + rss.channel.description
rss.items.each do |item|
  puts item.pubDate.strftime("%Y/%m%d") + ":#{item.title}"
end


require "rss"

rss = RSS::Maker.make("2.0") do |marker|
  maker.channel.about = "http://example.jp/recipe/recipe.rdf"
  maker.channel.title = "RubyrecipesRSS"
  maker.channel.description = "text"
  maker.channel.link = "http://example.jp/recipe/"
  
  maker.items.do_sort = true
  
  maker.items.new_item do |item|
    item.link = "http://example.jp/recipe/1"
	item.title = "recipe 1"
	item.date = Time.parse("2017/11/07 10:10")
  end
  
  maker.items.new_item do |item|
    item.link = "http://example.jp/recipe/2"
	item.title = "recipe 2"
	item.date = Time.parse("2017/11/07 10:10")
  end
end
puts rss


//simpleapp.rb
class SimpleApp
  def call(env)
    [200,
	{"Content-Type" => "text/plain"},
	["Hello, world!"]]
  end
end

//simpleapp.ru
require 'simpleapp'

run SimpleApp.new
$rackup simpleapp.ru



require "cgi"

cgi = CGI.new

str = cgi.params["item1"][0]

checks = cgi.params["checkbox1"]

req = Rack::Request.new(env)
str = req.params["item1"]



require "cgi"
cgi = CGI.new
p cgi.query_string


query = ENV["QUERY_STRING"]

def call(env)
  query = env["QUERY_STRING"]
  ...
end


require "cgi"

cgi = CGI.new
cookies = cgi.cookies
cookies.each{|key, value|}
  p key, value
}


require "cgi"

cgi = CGI.new
cookie = cgi.cookies
count = cookie["ck1"][0].to_i + 1
new_cookie = CGI::Cookie.new("name" => "ck1",
                             "value" => count.to_s,
							 "path" => "/",
							 "expires" => nil,
							 "secure" => false)
print cgi.header("type" => "text/plain", "cookie" => [new_cookie])
puts count



req = Rack:Request.new(env)
count = req.cookies["ck1"].to_i + 1

res = Rack::Response.new
res.set_cookie("ck1", count)


require "cgi"
require "cgi/session"
require "cgi/session/pstore"

cgi = CGI.new
session = CGI::Session.new(cgi,
  "database_manager" => CGI::Session::PStore,
  "domain" => "example.jp", "path" => "/",
  "tmpdir" => "/tmp/sess", "session_key" => "mysessid"
  "session_expires" => 0, "secure" => 1
)

session["count"] ||= 0
session["count"] += 1
session.close

print cgi.header("text/plain")
puts session["count"]



user Rack::Session::Cookie, :key => "rack_session",
       :domain => "example.jp", :paht => "/",
	   :expire_after => 2592000, :secret => "secret_value"
	   
def call(env)
  req = Rack::Request.new(env)
  count = req.session["count"]
  ...
end


referer = ENV["HTTP_REFERER"]

require "cgi"
cgi = CGI.new
referer = cgi.referer

def call(env)
  referer = env["HTTP_REFERER"]
  ...
end


require "cgi"
cgi = CGI.new
header = {"type" => "text/html",
          "charset" +> "Shift_JIS",
		  "X-My-Header" => "foo"}
print cgi.header(header)
print "<html><title>test</title>"
print "<body><p>test.</p></body></html>\r\n"

require "cgi"
cgi = CGI.new
print cgi.header("status=>"MOVED", "Location"=>"http://example.jp/test2.cgi")

=> HTTP/1.1 301 Moved Premanently
   Date.....
   
def call(env)
  header = {"Content-Type" => "text/html;charset=Shift_JIS",
            "X-My-Header" => "foo"}
  [ 200,
    header,
	"<html><title>test</title>"+
	  "<body><p>test.</p></body></html>\r\n"
  ]
end


def call(env)
  res = Rack::Response.new do |r|
    r.status = 301
	r[Location'] = "http://example.jp/test2.cgi"
  end
  res.finish
end


require "erb"
str = "text"
uri ="http://www.example.com/q.cgi?name=" + ERB::Util.u(str)
p uri


require "cgi"
str = "text"
puts CGI.unescape(CGI.escape(str))


require "cgi"
str = "x<0 & y>1"
enc_str = CGI.escapeHTML(str)
p enc_str

require "cgi"
def escapeHTML(str)
  CGI.escapeHTML(str).gsub(/'/n, "&#39;")
end

str ='"It\'s me!", he said.'
enc_str - escapeHTML(str)
p enc_str


require "cgi"
enc_str = "x&lt;0 &amp; y&gt;1"
str = CGI.unescapeHTML(enc_str)
p str


name = cgi.params["name"][0]
output = "<strong>#{CGI.escapeHTML(name)}</strong>"

require "erb"
require "cgi"
include ERB::Util
str = <<EOB
<html>
<head><title>ERBtest</title></head>
<body>
<h1>ERBtest</h1>
<p>Time<%= h(Time.now.to_s) %>.</p>
</body>
</html>
EOB
print ERB.new(str).result