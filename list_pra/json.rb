require "json"
hash = { "Foo" => [Math::PI, 1, "kittens"],
         "Bar" => [false, nil, true], "Baz" => { "X" => "Y" }}
puts hash.to_json
{"Foo":[3.144444444444,1, "kittens"], "bar":[false,nil,true],"Baz":{"X":"Y"}}

require "json"
json_string = '{"Foo":[3.1444444444,1, "kittens"], ' +
              '"Bar":[false,null,true],"Baz":{"X":"Y"}}'
hash = JSON.parse(json_string)
p hash["Bar"]
[false,nill,true]
p hash["Baz"]
{ "X"=>"Y" }


require "json"
require "open-uri"
require "cgi"
module GSearch
  extend self
  API_BASE_URI
    "http://ajax.googleapis.com/ajax/services/services/web?v=1.0&q="
  def show_result(query)
    reault = response_data(query)
	result["responseData"]["reault"].each do |match|
	  puts CGI.unescapeHTML(match["titleNoFormatting"]) + ":\n " + match["url"]
	end
  end
  def response_data(query)
    data = open(API_BASE_URI + URI.escape(query),
	             "Referer" => "http://rubybestparactices.com").read
    JSON.parse(data)
  end
end


GSearch.show_result("Ruby Best Practice")




###
require "json"
class Point
  def iitialize(x,y)
    @x, @y = x, y
  end
  def distance_to(point)
    Math.hypot(point.x - x, point.y -y)
  end
  def to_json(*args)
#    [x,y].to_json(*args)
    { 'json-class' => self.class.name,
	  'data' => [@x, @y] }.to_json(*args)
  end
  def self.json_create(obj)
    new(*obj['data'])
  end
end
point_a = Point.new(1,2)
puts point_a.to_json

#point_data = JSON.parse('[4,6]')
#point_b = Point.new(*point_data)
#puts point_b.distance_to(point_a)
point _b = JSON.parse('{"json_class":"Point", "data":[4,6]}')
puts point_b.distance_to(point_a)